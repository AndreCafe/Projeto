unit ncaPanVendaProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPanVendaProdBase, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxPCdxBarPopupMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus,
  DB, nxdb, StdCtrls, cxButtons, cxLabel, cxCurrencyEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxPC, cxRadioGroup, LMDPNGImage, ExtCtrls;

type
  TFrmPanVendaProd = class(TFrmPanVendaProdBase)
    panInner: TLMDSimplePanel;
    panBuscaTop: TLMDSimplePanel;
    panProd: TLMDSimplePanel;
    panRB: TLMDSimplePanel;
    rgCodigo: TcxRadioButton;
    rgDescr: TcxRadioButton;
    pgProd: TcxPageControl;
    tsBuscarCod: TcxTabSheet;
    edCod: TcxTextEdit;
    tsDescr: TcxTabSheet;
    edDescr: TcxLookupComboBox;
    panQtd: TLMDSimplePanel;
    edQtd: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    lbUnit: TcxLabel;
    edUnit: TcxCurrencyEdit;
    lbUnidade: TcxLabel;
    panAdd: TLMDSimplePanel;
    btnLancar: TcxButton;
    panDetalhes: TLMDSimplePanel;
    lbNomeProd: TcxLabel;
    panEstoque: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    lbQuant: TcxLabel;
    panPreco: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    lbPreco: TcxLabel;
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
    Image1: TImage;
    procedure rgCodigoClick(Sender: TObject);
    procedure rgDescrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDescrEnter(Sender: TObject);
    procedure edDescrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDescrPropertiesCloseUp(Sender: TObject);
    procedure edDescrPropertiesEditValueChanged(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure edQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQtdPropertiesChange(Sender: TObject);
    procedure edQtdPropertiesEditValueChanged(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure edUnitKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodPropertiesChange(Sender: TObject);
    procedure edCodPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FIDProd : Integer;
    FCodStr : String;
    FLastCod  : Integer;
    FCodRepetido : Boolean;
    
    procedure _Lancar;
    procedure SetIDProd(const Value: Integer);
    procedure SetCodStr(const Value: String);
  public
    procedure AjustaOrdem(aSalvaOrdem: Boolean = False);

    procedure AtualizaDetalhes; 

    procedure Clear; override;
    procedure FocusProd; override;
    function CanCloseForm: Boolean; override;
    
    property IDProd: Integer
      read FIDProd write SetIDProd;
    
    property CodStr: String
      read FCodStr write SetCodStr;
  
    { Public declarations }
  end;

var
  FrmPanVendaProd: TFrmPanVendaProd;

implementation

uses ncaDM, ncaFrmPri, ncClassesBase, ncErros, ncaFrmEscolhaProdDup, ncaFrmQuickCadProduto;

{$R *.dfm}

resourcestring
  SEsteProdutoNãoPermiteASuaVendaFr = 'Este produto não permite a sua venda fracionada!';


procedure TFrmPanVendaProd.AjustaOrdem(aSalvaOrdem: Boolean);
begin
  if rgCodigo.Checked = (slConfig.Values['OrdemProd']='1') then Exit;

  if rgCodigo.Checked then 
    slConfig.Values['OrdemProd'] := '1' else  // do not localize
    slConfig.Values['OrdemProd'] := '0'; // do not localize
  if aSalvaOrdem then SaveConfig;
end;

procedure TFrmPanVendaProd.AtualizaDetalhes;
begin
  panDetalhes.Visible := (IDProd>0);
  if IDProd>0 then begin
    lbNomeProd.Caption := tProDescricao.Value;
    if TipoTran=trEstEntrada then 
      edUnit.Value := tProCustoUnitario.Value;
    lbUnidade.caption := tProUnid.value;
    lbQuant.Caption := FloatToStr(Int(tProEstoqueAtual.Value*1000)/1000);
    lbPreco.Caption := FloatToStrF(tProPreco.Value, ffCurrency, 10, 2);
    lbNomeProd.Left := 0;
    lbNomeProd.Visible := (pgProd.ActivePageIndex=0);
  end else begin
    edUnit.Value := 0;
    lbUnidade.Caption := '';
    btnLancar.Enabled := False;
  end;
end;

procedure TFrmPanVendaProd.btnLancarClick(Sender: TObject);
begin
  inherited;
  if not(tProPermiteVendaFracionada.value) and (frac(edQtd.Value)>0) then begin
      edQtd.Value := trunc(edQtd.Value);
      edQtd.SelectAll;
      edQtd.SetFocus;
      Raise ENexCafe.Create(SEsteProdutoNãoPermiteASuaVendaFr);
  end;

  AddProd(tProID.Value, edUnit.Value, edUnit.Value*edQtd.Value, edQtd.Value, tProDescricao.Value, False, tProFidPontos.Value);

  Clear;
end;

function TFrmPanVendaProd.CanCloseForm: Boolean;
begin
  Result := not edDescr.DroppedDown;
end;

procedure TFrmPanVendaProd.Clear;
begin
  if pgProd.ActivePageIndex=0 then begin
    edCod.Text := '';
    edCod.SetFocus;
  end else begin
    edDescr.EditValue := '';
    edDescr.SetFocus;
  end;
  IDProd := 0;
  edQtd.Value := 1;
end;

procedure TFrmPanVendaProd.cxLabel1Click(Sender: TObject);
begin
  inherited;
  edQtd.SetFocus;
end;

procedure TFrmPanVendaProd.edCodKeyUp(Sender: TObject; var Key: Word;
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
             i := TFrmEscolhaProdDup.Create(self).Mostrar(edCod.EditingText);
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
          if (trim(edCod.Text)<>'') and (GConfig.QuickCad) then begin
            beep;
            IDProd := TFrmQuickCadProduto.Create(Self.Handle, Self).Incluir(edCod.Text, tPro);
            if (IDProd>0) then _Lancar;
          end;
      end;
  end;
end;

procedure TFrmPanVendaProd.edCodPropertiesChange(Sender: TObject);
begin
  inherited;
  edCod.PostEditValue;
end;

procedure TFrmPanVendaProd.edCodPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (Trim(edCod.Text)>'') and tPro.Locate('Codigo', edCod.Text, []) then 
    IDProd := tProID.Value else
    IDProd := 0;
end;

procedure TFrmPanVendaProd.edDescrEnter(Sender: TObject);
begin
  inherited;
  edDescr.EditValue := '';
  IDProd := 0;
end;

procedure TFrmPanVendaProd.edDescrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) then begin
    edDescrPropertiesCloseUp(nil);
    if IDProd>0 then _Lancar;
  end;
end;

procedure TFrmPanVendaProd.edDescrPropertiesCloseUp(Sender: TObject);
begin
  edDescrPropertiesEditValueChanged(nil);
end;

procedure TFrmPanVendaProd.edDescrPropertiesEditValueChanged(
  Sender: TObject);
var aCod: Integer;
begin
  try
    aCod := edDescr.EditValue;
  except
    aCod := 0;
  end;
  if aCod=FLastCod then Exit;
  FLastCod := aCod;
  IDProd := aCod;
end;

procedure TFrmPanVendaProd.edQtdKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmPanVendaProd.edQtdPropertiesChange(Sender: TObject);
begin
  inherited;
  edQtd.PostEditValue;
end;

procedure TFrmPanVendaProd.edQtdPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  btnLancar.Enabled := (IDProd>0) and (edQtd.EditValue>0);
end;

procedure TFrmPanVendaProd.edUnitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) and btnLancar.Enabled then 
    btnLancarClick(nil);
end;

procedure TFrmPanVendaProd.FocusProd;
begin
  inherited;
  if pgProd.ActivePageIndex=0 then
    edCod.SetFocus else
    edDescr.SetFocus;

end;

procedure TFrmPanVendaProd.FormCreate(Sender: TObject);
begin
  inherited;
  FIDProd := 0;
  FCodStr := '';
  FLastCod := -1;
  FCodRepetido := False;
  FCodStr := '';
  rgDescr.TabStop := False;
  edDescr.EditValue := null;
  lbUnidade.caption := '';
  try
    if slConfig.Values['OrdemProd']='1' then
      rgCodigo.Checked := True else
      rgDescr.Checked := True;
  except
  end;
end;

procedure TFrmPanVendaProd.rgCodigoClick(Sender: TObject);
begin
  inherited;
  pgProd.ActivePageIndex := 0;
  edCod.Clear;
  panDetalhes.Visible := False;
  edCod.SetFocus;
  AjustaOrdem(True);
end;

procedure TFrmPanVendaProd.rgDescrClick(Sender: TObject);
begin
  pgProd.ActivePageIndex := 1;
  edDescr.Clear;
  panDetalhes.Visible := False;
  edDescr.SetFocus;
  AjustaOrdem(True);
end;

procedure TFrmPanVendaProd.SetCodStr(const Value: String);
begin
  if FCodStr = Value then Exit;
  FCodStr := Value;
  if FCodStr>'' then begin
    tCodR.SetRange([FCodStr], [FCodStr]);
    FCodRepetido := (tCodR.RecordCount>1);
  end;
end;

procedure TFrmPanVendaProd.SetIDProd(const Value: Integer);
begin
  if Value=FIDProd then Exit;
  FIDProd := Value;
  if FIDProd>0 then begin
    tPro.Locate('ID', FIDProd, []);
    CodStr := tProCodigo.Value;
    //MostrarUnit := ((FME.Tipo=trEstVenda) and tProPodeAlterarPreco.Value) or (FME.Tipo=trEstCompra);
    case TipoTran of
      trEstVenda : begin
        edUnit.Value := tProPreco.Value;
        edUnit.Properties.ReadOnly := not tProPodeAlterarPreco.Value;
      end;
      trEstCompra : begin
        edUnit.Value := tProCustoUnitario.Value;
        edUnit.Properties.ReadOnly := False;
      end
    else
      edUnit.Value := 0;
    end;
  end else
    CodStr := '';
  btnLancar.Enabled := (FIDProd>0) and(edQtd.EditValue>0);
  AtualizaDetalhes;  
end;

procedure TFrmPanVendaProd._Lancar;
begin
  if btnLancar.Enabled then begin
    if TipoTran=trEstCompra then
      edQtd.SetFocus
    else
    if tProPodeAlterarPreco.Value then 
      edUnit.SetFocus else
      btnLancarClick(nil);
  end else
    if edQtd.EditValue<0.001 then
      edQtd.SetFocus;
end;

end.
