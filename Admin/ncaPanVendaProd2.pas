unit ncaPanVendaProd2;

interface

{$I NEX.INC}

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
  LMDLabel, cxSpinEdit, ComCtrls, LMDCustomComponent, LMDGlobalHotKey, ncClassesBase,
  ImgList, ncMyImage;

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
    tProIncluidoEm: TDateTimeField;
    DataSource1: TDataSource;
    tCodR: TnxTable;
    popFrm: TSpTBXFormPopupMenu;
    TimerPop: TTimer;
    TimerSelectAllProd: TTimer;
    TimerFocusProd: TTimer;
    LMDSimplePanel3: TLMDSimplePanel;
    panQtd: TLMDSimplePanel;
    edQtd: TcxCurrencyEdit;
    btnLancar: TcxButton;
    panValor: TLMDSimplePanel;
    lbTotal: TcxLabel;
    lbSize: TcxLabel;
    TimerClosePesq: TTimer;
    imgsPin: TcxImageList;
    cxLabel1: TcxLabel;
    panEdProd: TLMDSimplePanel;
    edProd: TcxButtonEdit;
    cxLabel3: TcxLabel;
    panPreco: TLMDSimplePanel;
    lbPreco: TcxLabel;
    edUnit: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    lbDigiteProduto: TcxLabel;
    lbUnidade: TcxLabel;
    TimerAutoPop: TTimer;
    tProPrecoAuto: TBooleanField;
    tProMargem: TFloatField;
    tProComissaoPerc: TFloatField;
    tProComissaoLucro: TBooleanField;
    tProRecVer: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure edQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQtdPropertiesChange(Sender: TObject);
    procedure edQtdPropertiesEditValueChanged(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure edCodKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodEnter(Sender: TObject);
    procedure lbPromptProdClick(Sender: TObject);
    procedure panQtdEnter(Sender: TObject);
    procedure panBuscaTopResize(Sender: TObject);
    procedure TimerPopTimer(Sender: TObject);
    procedure TimerSelectAllProdTimer(Sender: TObject);
    procedure edProdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edProdPropertiesChange(Sender: TObject);
    procedure edProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popFrmPopup(Sender: TObject);
    procedure popFrmClosePopup(Sender: TObject; Selected: Boolean);
    procedure lbCifraoUnitClick(Sender: TObject);
    procedure lbUnidadeClick(Sender: TObject);
    procedure popFrmBeforePopup(Sender: TObject; var FormWidth,
      FormHeight: Integer);
    procedure edUnitPropertiesEditValueChanged(Sender: TObject);
    procedure edUnitPropertiesChange(Sender: TObject);
    procedure TimerFocusProdTimer(Sender: TObject);
    procedure lbDigiteProdutoClick(Sender: TObject);
    procedure panVendaProdResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edProdFocusChanged(Sender: TObject);
    procedure edQtdFocusChanged(Sender: TObject);
    procedure edUnitFocusChanged(Sender: TObject);
    procedure TimerClosePesqTimer(Sender: TObject);
    procedure edUnitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edProdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLabel3Click(Sender: TObject);
    procedure lbPrecoClick(Sender: TObject);
    procedure TimerAutoPopTimer(Sender: TObject);
    procedure edProdExit(Sender: TObject);
  private
    { Private declarations }
    FIDProd : Integer;
    FCodStr : String;
    FIDProdPopped  : Integer;
    FPopped : Boolean;
    FCodRepetido : Boolean;
    FPesqProd : TFrmProdPesq;
    FSaveSt : String;
    FIgnoreChange : Boolean;
    FQuant : Double;
    FUnitario : Currency;
    FTotal : Currency;
    FCBBInfo: TncCodBarBalInfo;
    FTicksKey : Cardinal;
    FProdTexto : String;

    function CorFocus: TColor;
    
    procedure SetIDProd(const Value: Integer);
    procedure SetCodStr(const Value: String);
    procedure SetPopped(const Value: Boolean);
    procedure SetQuant(const Value: Double);
    procedure SetUnitario(const Value: Currency);
    procedure SetTotal(const Value: Currency);

    procedure AlinhaQtd;

    function PassarQtd: Boolean;
    function ComecarPorQtd: Boolean;
    function BuscaAuto: Boolean;
  protected
    procedure SetQuantCustom(const aValue: Double; aUpdateEdit: Boolean = False);
    procedure SetUnitarioCustom(const Value: Currency; UpdateEdit: Boolean);
    procedure CalcTotal;
    procedure OnRollUpFocusChange(Sender: TObject; var RollUp: Boolean);

    function QuantOk(aProduto: Cardinal; aQuant, aEstoque: Double): Boolean;

    function Focado: Boolean;

    procedure UpdateColor;

    procedure DecodeCodBarBalanca;

    procedure wmPopFrm(var Msg: TMessage);
      message wm_user;
    
  public
    procedure _Lancar;
    
    procedure AtualizaDetalhes; 

    procedure AjustaPanQtd;

    procedure ClosePops; override;

    procedure UpdateProdEdit(aSelectAll: Boolean);

    function AjustaQuantFromText(S: String): Boolean;

    procedure UpdateQtdWidth;
    procedure UpdateUnitWidth;

    procedure SetGap(aPixels: Integer); override;

    procedure Clear; override;
    procedure FocusProd; override;
    function CanCloseForm: Boolean; override;

    property Quant: Double
      read FQuant write SetQuant;

    property Unitario: Currency
      read FUnitario write SetUnitario; 

    property Total: Currency
      read FTotal write SetTotal;   

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

uses ncaDM, ncaFrmPri, ncErros, ncaFrmEscolhaProdDup, ncaFrmQuickCadProduto,
  ncaFrmSemEstoque, ncaFrmProdSemFid;

{$R *.dfm}

resourcestring
  SEsteProdutoNãoPermiteASuaVendaFr = 'Este produto não permite a sua venda fracionada!';
  SCustoUnitario = 'Custo Unitário';
  SPreco = 'Preço Unitário';

procedure TFrmPanVendaProd2.AjustaPanQtd;
begin
  panVendaProd.Parent.Height := panProd.Height;
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

  UpdateQtdWidth;
end;

procedure TFrmPanVendaProd2.AlinhaQtd;
begin
  if ComecarPorQtd then begin
    panQtd.Align := alLeft;
    panQtd.TabOrder := 0;
    panEdProd.TabOrder := 1;
  end else begin
    panQtd.Align := alRight;
    panEdProd.TabOrder := 0;
    panQtd.TabOrder := 1;
  end;

  panPreco.TabOrder := 2;
  panValor.TabOrder := 4;
  btnLancar.TabOrder := 5;
  btnLancar.Left := 4000;
      
  panQtd.Left := -100;
end;

procedure TFrmPanVendaProd2.AtualizaDetalhes;
begin
  btnLancar.Enabled := (FIDProd>0) and(edQtd.EditValue>0);

  if IDProd>0 then begin
    panValor.Enabled := True;
    panPreco.Enabled := True;
    edUnit.Enabled := tProPodeAlterarPreco.Value or (TipoTran=trEstCompra);
    lbTotal.Enabled := True;
    
{    if TipoTran=trEstCompra then 
      edUnit.Value := tProCustoUnitario.Value;}
    lbUnidade.caption := tProUnid.value;
    lbUnidade.Visible := (lbUnidade.Caption>'');
  end else begin
//    panValor.Visible := False;
//    panPreco.Visible := False;

    panValor.Enabled := False;
    panPreco.Enabled := False;
    edUnit.Enabled := False;
    lbTotal.Enabled := False;

    Unitario := 0;
    Total := 0;

    lbTotal.Caption := '';
    edUnit.Clear;

    lbUnidade.Caption := '';
    lbUnidade.Visible := False;
    btnLancar.Enabled := False;
  end;
  UpdateQtdWidth;
end;

procedure TFrmPanVendaProd2.btnLancarClick(Sender: TObject);
var PermSemEstoque: Boolean; T: Currency;
begin
  inherited;
  if ResgateFid then
  if not (tProFidelidade.Value and (tProFidPontos.Value>0)) then begin
    TFrmProdSemFid.Create(Self).Mostrar(tPro);
    if not (tProFidelidade.Value and (tProFidPontos.Value>0)) then Exit;
  end;
  
  if not(tProPermiteVendaFracionada.value) and (frac(edQtd.Value)>0) then begin
    edQtd.Value := trunc(edQtd.Value);
    edQtd.SelectAll;
    edQtd.SetFocus;
    Raise ENexCafe.Create(SEsteProdutoNãoPermiteASuaVendaFr);
  end;

  PermSemEstoque := False;

  if (Self.TipoTran in [trEstVenda, trEstSaida]) then
  if (not QuantOk(tProID.Value, edQtd.Value, tProEstoqueAtual.Value)) and gConfig.NaoVenderAlemEstoque and (not tProNaoControlaEstoque.Value) then begin
    PermSemEstoque := TFrmSemEstoque.Create(Self).PodeVender(tProDescricao.Value, tProEstoqueAtual.Value);
    if not PermSemEstoque then Exit;
  end;

  if FCBBInfo.IsEmpty or (not FCBBInfo.BalValor) then
    T := FUnitario*edQtd.Value else
    T := FCBBInfo.PesoValor;
    
  AddProd(tProID.Value, FUnitario, T, edQtd.Value, tProDescricao.Value, PermSemEstoque, tProFidPontos.Value);
  
  Clear;

  if ComecarPorQtd then
    edQtd.SetFocus else
    edProd.SetFocus;
end;

function TFrmPanVendaProd2.BuscaAuto: Boolean;
begin
  Result := (slConfig.Values['DesligaBuscaAuto']<>'1');
end;

procedure TFrmPanVendaProd2.CalcTotal;
begin
  Total := FUnitario * FQuant;
end;

function TFrmPanVendaProd2.CanCloseForm: Boolean;
begin
  Result := not FPopped;
end;

procedure TFrmPanVendaProd2.Clear;
begin
  FIgnoreChange := True;
  try
    FCBBinfo.Clear;
    IDProd := 0;
    FIDProdPopped := 0;
    edProd.Clear;
    Quant := 1;
    Unitario := 0;
    Total := 0;

    edUnit.Clear;
    edUnit.Enabled := False;

    lbTotal.Enabled := False;
    lbTotal.Caption := '';

    AlinhaQtd;
    
    FPesqProd.edBusca.Clear;
    FPesqProd.TimerSync.Enabled := False;
  finally
    FIgnoreChange := False;
  end;
end;

procedure TFrmPanVendaProd2.ClosePops;
begin
  inherited;
  Popped := False;
end;

function TFrmPanVendaProd2.ComecarPorQtd: Boolean;
begin
  Result := (slConfig.Values['ComecarPor']='1');
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

procedure TFrmPanVendaProd2.cxLabel3Click(Sender: TObject);
begin
  inherited;
  edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.DecodeCodBarBalanca;
begin
  FCBBInfo.Clear;
  if gConfig.IsPremium then
  if gConfig.DecodeCodBarBalanca(edProd.EditingText, FCBBInfo) then
    edProd.EditingText := FCBBInfo.Codigo;
end;

procedure TFrmPanVendaProd2.edCodEnter(Sender: TObject);
begin
  inherited;
  FProdTexto := edProd.EditingText;
  TimerSelectAllProd.Enabled := True;
  UpdateQtdWidth;
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

procedure TFrmPanVendaProd2.edProdExit(Sender: TObject);
begin
  inherited;
  TimerAutoPop.Enabled := False;
end;

procedure TFrmPanVendaProd2.edProdFocusChanged(Sender: TObject);
begin
  inherited;
  UpdateColor;
end;

function GetCharFromVirtualKey(Key: Word): string;
 var
    keyboardState: TKeyboardState;
    asciiResult: Integer;
 begin
    GetKeyboardState(keyboardState) ;
 
    SetLength(Result, 2) ;
    asciiResult := ToAscii(key, MapVirtualKey(key, 0), keyboardState, @Result[1], 0) ;
    case asciiResult of
      0: Result := '';
      1: SetLength(Result, 1) ;
      2:;
      else
        Result := '';
    end;
 end; 

procedure TFrmPanVendaProd2.edProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var 
  WasPopped: Boolean;  
  S: String;
begin
  inherited;
  
  if (edProd.CursorPos=0) and ((Key = VK_BACK) or (Key = VK_LEFT)) and ComecarPorQtd then
  begin
    Popped := False;
    edQtd.SetFocus;
    edQtd.SelectAll;
  end;

  FSaveSt := edProd.EditingText;
  WasPopped := Popped;

  if Popped and FPesqProd.InCadRapido then begin
    if (Key = Key_Enter) or (Key = Vk_Down) or (Key = Vk_Tab) then 
      FPesqProd.edCod.SetFocus;
  end else begin
    if Key=Key_Enter then begin
      DecodeCodBarBalanca;
      if not Popped then begin
        FPesqProd.edBusca.EditValue := edProd.EditingText;
        if (FPesqProd.RecCount<>1) or FPesqProd.AchouPorDescr or FPesqProd.AchouParcial then
        if (FIDProd=0) or (FIDProd<>FIDProdPopped) then begin
          Key := 0;
          Popped := True;
          Exit;
        end;
      end;

      if (not FCBBInfo.IsEmpty) and (FIDProd>0) then begin
        if FCBBInfo.BalValor then
          edQtd.Value := FCBBInfo.PesoValor / FUnitario else
          edQtd.Value := FCBBInfo.PesoValor;
        UpdateQtdWidth;  
      end;
      
      if (IDProd=0) and (not FPesqProd.Tab.IsEmpty) and WasPopped then IDProd := FPesqProd.TabID.Value;
    
      if (IDProd>0) then begin
        Key := 0;
        Popped := False;
        edProd.Text := tProDescricao.Value;
        FIgnoreChange := True;
        try
          if ComecarPorQtd or (not PassarQtd) then
            _Lancar else
            edQtd.SetFocus;
        finally
          FIgnoreChange := False;
        end;
      end;
    end else
    if Popped then
      FPesqProd.edBuscaKeyUp(Sender, Key, Shift);
  end;
  
end;

function TemLetras(S: String): Boolean;
var i: integer;
begin
  for I := 1 to Length(S) do  
    if S[i] in ['a'..'z', 'A'..'Z'] then begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

procedure TFrmPanVendaProd2.edProdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (FSaveSt <> edProd.EditingText) then begin
    if (Trim(edProd.EditingText)='') then begin
      IDProd := 0;
//      Exit;
    end else begin
    {$IFDEF LAN}
      Popped := True
    {$ELSE};
      if BuscaAuto then begin
        if TemLetras(edProd.EditingText) then
          Popped := True
        else 
        if (FProdTexto<>edProd.EditingText) and (not Popped) then 
          TimerAutoPop.Enabled := True;
        FProdTexto := edProd.EditingText;
      end;
    {$ENDIF}
    end;
  end;
end;

procedure TFrmPanVendaProd2.edProdPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  Popped := True;
end;

procedure TFrmPanVendaProd2.edProdPropertiesChange(Sender: TObject);

procedure ApagaTexto;
begin
  FIgnoreChange := True;
  try
    edProd.Text := '';
    IDProd := 0;
  finally
    FIgnoreChange := False;
  end;
end;

begin
  inherited;
//  lbDigiteProduto.Visible := (edProd.EditingText='');
  if edProd.Focused and (not FIgnoreChange) then begin

    if edProd.EditingText='*' then begin
      ApagaTexto;
      edQtd.SetFocus;
    end else begin
      if AjustaQuantFromText(edProd.EditingText) then ApagaTexto;
      if Popped then FPesqProd.edBusca.EditValue := edProd.EditingText
    end;
  end;
end;

procedure TFrmPanVendaProd2.edQtdFocusChanged(Sender: TObject);
begin
  inherited;
  UpdateColor;
  UpdateQtdWidth;
end;

procedure TFrmPanVendaProd2.edQtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (edProd.CursorPos=0) and ((Key = VK_BACK) or (Key = VK_LEFT)) and (not ComecarPorQtd) then
    edProd.SetFocus;
  
  if (FQuant>0) and (Key = Key_ENTER) then
  if not ComecarPorQtd then begin
    if IDProd=0 then
      edProd.SetFocus
    else
    if edUnit.Enabled then
      edUnit.SetFocus
    else
    if btnLancar.Enabled then
      btnLancarClick(nil);
  end else
    edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.edQtdPropertiesChange(Sender: TObject);
begin
  inherited;
  edQtd.PostEditValue;
  UpdateQtdWidth;
end;

procedure TFrmPanVendaProd2.edQtdPropertiesEditValueChanged(Sender: TObject);
begin
  lbSize.Caption := edQtd.EditingText;
  if edQtd.EditValue<>null then
    SetQuantCustom(edQtd.EditValue, False) else
    SetQuantCustom(0, False);

  btnLancar.Enabled := (IDProd>0) and (edQtd.EditValue>0);
end;

procedure TFrmPanVendaProd2.edUnitFocusChanged(Sender: TObject);
begin
  inherited;
  UpdateColor;
  UpdateUnitWidth;
end;

procedure TFrmPanVendaProd2.edUnitKeyDown(Sender: TObject; var Key: Word;
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
  UpdateUnitWidth;
end;

procedure TFrmPanVendaProd2.edUnitPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if edUnit.EditValue=null then
    SetUnitarioCustom(0, False) else
    SetUnitarioCustom(edUnit.EditValue, False);
end;

function TFrmPanVendaProd2.Focado: Boolean;
begin
  Result := edProd.Focused or edUnit.Focused or edQtd.Focused or FPopped;
end;

procedure TFrmPanVendaProd2.FocusProd;
begin
  inherited;

  AlinhaQtd;
  
  if ComecarPorQtd then
    edQtd.SetFocus else
    edProd.SetFocus;
end;

procedure TFrmPanVendaProd2.FormCreate(Sender: TObject);
begin
  inherited;
{$IFDEF LOJA}  
//  edProd.Properties.Buttons[0].Visible := False;
{$ENDIF} 

  FCBBInfo.Clear; 

  lbUnidade.Caption := '';
  FIgnoreChange := False;
  FSaveSt := '';
  FPesqProd := TFrmProdPesq.Create(Self);
  popFrm.PopupForm := FPesqProd;
  popFrm.OnRollUpFocusChange := OnRollUpFocusChange;
  FIDProd := 0;
  FQuant := 1;
  FPopped := False;
  FCodStr := '';
  FIDProdPopped := -1;
  FCodRepetido := False;
  FCodStr := '';
end;

procedure TFrmPanVendaProd2.FormResize(Sender: TObject);
begin
  inherited;
  AjustaPanQtd;
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

procedure TFrmPanVendaProd2.lbPrecoClick(Sender: TObject);
begin
  inherited;
  if edUnit.Enabled then edUnit.SetFocus;

end;

procedure TFrmPanVendaProd2.lbPromptProdClick(Sender: TObject);
begin
  inherited;
  edProd.SetFocus;
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

procedure TFrmPanVendaProd2.panVendaProdResize(Sender: TObject);
begin
  inherited;
  AjustaPanQtd;
end;

function TFrmPanVendaProd2.PassarQtd: Boolean;
begin
  Result := (slConfig.Values['NaoPassarQtd']<>'1');
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
  TimerClosePesq.Enabled := True;
end;

procedure TFrmPanVendaProd2.popFrmPopup(Sender: TObject);
begin
  inherited;
  FPopped := True;
end;

function TFrmPanVendaProd2.QuantOk(aProduto: Cardinal; aQuant,
  aEstoque: Double): Boolean;
begin
  Result := OnQuantOk(Self, aProduto, aQuant, aEstoque);
end;

procedure TFrmPanVendaProd2.panBuscaTopResize(Sender: TObject);
begin
  inherited;
  AjustaPanQtd;
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
  AjustaPanQtd;
end;

procedure TFrmPanVendaProd2.SetIDProd(const Value: Integer);
begin
  if Value=FIDProd then Exit;
  FIDProd := Value;
  if FIDProd>0 then begin
    if FPopped then 
      FIDProdPopped := FIDProd else
      FIDProdPopped := 0;
    
    tPro.Locate('ID', FIDProd, []);
    CodStr := tProCodigo.Value;
    //MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    case TipoTran of
      trEstVenda : begin
        Unitario := tProPreco.Value;
        edUnit.Enabled := tProPodeAlterarPreco.Value;
        edUnit.Properties.ReadOnly := False;
      end;
      trEstCompra : begin
        Unitario := tProCustoUnitario.Value;
        edUnit.Enabled := True;
        edUnit.Properties.ReadOnly := False;
      end
    else
      edUnit.Value := 0;
    end;
  end else
    CodStr := '';
  AtualizaDetalhes;  
end;

procedure TFrmPanVendaProd2.SetPopped(const Value: Boolean);
begin
  if Value = FPopped then Exit;
  if Value then 
    PostMessage(Handle, wm_user, 0, 0) else
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
  if aUpdateEdit then begin
    edQtd.Value := FQuant;
    UpdateQtdWidth;
  end;
  CalcTotal;
end;

procedure TFrmPanVendaProd2.SetTotal(const Value: Currency);
begin
  FTotal := Value;
  lbTotal.Caption := CurrencyToStr(FTotal);
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
  if UpdateEdit then begin
    edUnit.Value := FUnitario;
    UpdateUnitWidth;
  end;
  CalcTotal;
end;

procedure TFrmPanVendaProd2.TimerAutoPopTimer(Sender: TObject);
begin
  inherited;
  TimerAutoPop.Enabled := False;
  if (not Popped) and edProd.Focused then
    Popped := True;
end;

procedure TFrmPanVendaProd2.TimerClosePesqTimer(Sender: TObject);
begin
  inherited;
  TimerClosePesq.Enabled := False;
  FPopped := False;
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
  P.Y := 0;
  P := edProd.ClientToScreen(P);
  popFrm.Popup(P.X, P.Y);
end;

procedure TFrmPanVendaProd2.TimerSelectAllProdTimer(Sender: TObject);
begin
  inherited;
  TimerSelectAllProd.Enabled := False;
  edProd.SelectAll;
end;

procedure TFrmPanVendaProd2.UpdateColor;
begin
  if edProd.Focused then
    lbDigiteProduto.Style.Color := FrmPri.cxEditStyleController1.StyleFocused.Color else
    lbDigiteProduto.Style.Color := clWhite;
    
{  if Focado then 
    panProd.Color := CorFocus else
    panProd.Color := clBtnFace;}
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

procedure TFrmPanVendaProd2.UpdateQtdWidth;
var w: integer;
begin
  w := cxTextWidth(edQtd.Style.Font, edQtd.EditingText)+20;
  if w<80 then w := 80;

  if lbUnidade.Visible then W := W + lbUnidade.Width + lbUnidade.Margins.Right + lbUnidade.Margins.Left;

  panQtd.Width := W;

  UpdateUnitWidth;
end;

procedure TFrmPanVendaProd2.UpdateUnitWidth;
var W: Integer;
begin
  W := cxTextWidth(lbTotal.Style.Font, lbTotal.Caption);
  if W <100 then W := 100;
  W := W + lbTotal.Margins.Left + lbTotal.Margins.Right + 20;
  panValor.Width := W;

  W := cxTextWidth(edUnit.Style.Font, edUnit.EditingText);
  if W <100 then W := 100;
  W := W + edUnit.Margins.Left + edUnit.Margins.Right + 20;
  panPreco.Width := W;
  
{  if edUnit.Focused then
    lbSize.Caption := edUnit.EditingText else
    lbSize.Caption := CurrencyToStr(FUnitario);

  if edUnit.Focused and (lbSize.Width<138) then
    edUnit.Width := 148 else
    edUnit.Width := lbSize.Width + 10;}

{  lbX2.Left := 0;
  edUnit.Left := lbX2.Width;
  lbIgual.Left := edUnit.Left + edUnit.Width;
  lbTotal.Left := lbIgual.Left + lbIgual.Width;}

end;

procedure TFrmPanVendaProd2.wmPopFrm(var Msg: TMessage);
var P : TPoint;
begin
  TimerPop.Enabled := False;
  P.X := 0;
  P.Y := 0;
  P := edProd.ClientToScreen(P);
  popFrm.Popup(P.X, P.Y+edProd.Height-2);
end;

procedure TFrmPanVendaProd2._Lancar;
begin
  if btnLancar.Enabled then begin
    case TipoTran of
      trEstCompra : if (not edUnit.Focused) then begin
        edUnit.SetFocus;
        Exit;
      end;
      trEstVenda  : if (not edUnit.Focused) and tProPodeAlterarPreco.Value then begin
        edUnit.SetFocus;
        Exit;
      end;
    end;
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
