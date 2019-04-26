unit ncaFrmProduto_PrecoAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, 
  StdCtrls, cxRadioGroup, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, cxLabel, cxPCdxBarPopupMenu, cxPC, ExtCtrls;

type
  TFrmProd_PrecoAuto = class(TForm)
    panPri: TLMDSimplePanel;
    panPreco: TLMDSimplePanel;
    lbPreco: TcxLabel;
    cbAuto: TcxCheckBox;
    edPreco: TcxCurrencyEdit;
    panCustoMargem: TLMDSimplePanel;
    panCusto: TLMDSimplePanel;
    lbCusto: TcxLabel;
    edCusto: TcxCurrencyEdit;
    panMargem: TLMDSimplePanel;
    lbMargem: TcxLabel;
    edMargem: TcxCurrencyEdit;
    pgMargem: TcxPageControl;
    tsMargemPadrao: TcxTabSheet;
    cbMargemPadrao: TcxCheckBox;
    tsDefMargemPadrao: TcxTabSheet;
    lbDefMargemPadrao: TcxLabel;
    cbAlteraPreco: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbAutoClick(Sender: TObject);
    procedure cbMargemPadraoClick(Sender: TObject);
    procedure edPrecoPropertiesChange(Sender: TObject);
    procedure edPrecoPropertiesEditValueChanged(Sender: TObject);
    procedure edCustoPropertiesChange(Sender: TObject);
    procedure edCustoPropertiesEditValueChanged(Sender: TObject);
    procedure edMargemPropertiesChange(Sender: TObject);
    procedure edMargemPropertiesEditValueChanged(Sender: TObject);
    procedure edPrecoFocusChanged(Sender: TObject);
    procedure edPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMargemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbCustoClick(Sender: TObject);
    procedure lbPrecoClick(Sender: TObject);
    procedure lbMargemClick(Sender: TObject);
    procedure lbDefMargemPadraoClick(Sender: TObject);
    procedure cbAutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbAlteraPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOnFocusNext : TNotifyEvent;
    FOnChange : TNotifyEvent;
    
    FSavePreco: Currency;
    FSaveMargem: Double;
    FIniciando : Boolean;

    FMargem : Variant;
    FPreco  : Currency;
    FCusto  : Currency;
    
    function GetCusto: Currency;
    function GetMargem: Variant;
    function GetPrecoAuto: Boolean;
    function GetPrecoVenda: Currency;
    procedure SetCusto(const Value: Currency);
    procedure SetMargem(const Value: Variant);
    procedure SetPrecoAuto(const Value: Boolean);
    procedure SetPrecoVenda(const Value: Currency);

    procedure AtualizaTela;

    procedure CalcPrecoMargem;

    procedure FocusNext;
    { Private declarations }
  public
     procedure FocusFirst;

     function PodeAlterarPreco: Boolean;

     procedure InitData(aPreco, aCusto: Currency; aMargem: Variant; aPrecoAuto, aAlteraPreco: Boolean);

     property OnChange: TNotifyEvent
       read FOnChange write FOnChange;
     
     property PrecoAuto: Boolean
       read GetPrecoAuto write SetPrecoAuto;

     property Preco: Currency
       read GetPrecoVenda write SetPrecoVenda;

     property Custo: Currency
       read GetCusto write SetCusto;

     property Margem: Variant
       read GetMargem write SetMargem;

     property OnFocusNext: TNotifyEvent 
       read FOnFocusNext write FOnFocusNext;  
     
    { Public declarations }
  end;

var
  FrmProd_PrecoAuto: TFrmProd_PrecoAuto;

implementation

uses ncaFrmPri, ncClassesBase, ncaFrmConfigPrecoAuto, ncaFrmOpcoes, ncIDRecursos, ncaDM;

{$R *.dfm}

{ TFrmProd_PrecoAuto }

procedure TFrmProd_PrecoAuto.AtualizaTela;
begin
  if gConfig.Margem<0.01 then
    pgMargem.ActivePage := tsDefMargemPadrao else
    pgMargem.ActivePage := tsMargemPadrao;
  
  if PrecoAuto then begin
    edPreco.Enabled := False;
    panPreco.Color := clBtnFace;
    lbPreco.Enabled := False;
    pgMargem.Visible := True;
  end else begin
    pgMargem.Visible := False;
    edPreco.Enabled := True;
    if edPreco.Focused then
      panPreco.Color := FrmPri.FocusColor else
      panPreco.Color := clWhite;
    lbPreco.Enabled := True;
  end;

  if cbMargemPadrao.Checked or (not cbAuto.Checked) then begin
    edMargem.Enabled := False;
    panMargem.Color := clBtnFace;
    lbMargem.Enabled := False;
  end else begin
    edMargem.Enabled := True;
    if edMargem.Focused then
      panMargem.Color := FrmPri.FocusColor else
      panMargem.Color := clWhite;
    lbMargem.Enabled := False;
  end;

  if pgMargem.Visible then begin
    if cbMargemPadrao.Checked then begin
      FMargem := gConfig.Margem;
      edMargem.Value := FMargem;
    end;
  end;
  
  CalcPrecoMargem;
end;

procedure TFrmProd_PrecoAuto.CalcPrecoMargem;
begin
  if cbAuto.Checked then begin
    if (FCusto > 0) then
      edPreco.Value := gConfig.CalcPreco(Margem, FCusto) else
      edPreco.Clear;
  end else 
    if (FCusto>0.0001) and (FPreco>0.0001) then begin
      FMargem := ((FPreco / FCusto) * 100) - 100;
      edMargem.Value := FMargem;
    end;

  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TFrmProd_PrecoAuto.cbAlteraPrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then FocusNext;
end;

procedure TFrmProd_PrecoAuto.cbAutoClick(Sender: TObject);
begin
  if FIniciando then Exit;

  if cbAuto.Checked then 
    FSavePreco := edPreco.Value  else 
    edPreco.Value := FSavePreco;
  AtualizaTela;
  if cbAuto.Checked then begin
    if panCustoMargem.Visible and panCustoMargem.Enabled then
      edCusto.SetFocus;
  end else
    edPreco.SetFocus;
end;

procedure TFrmProd_PrecoAuto.cbAutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  if panCustoMargem.Visible and panCustoMargem.Enabled then
    edCusto.SetFocus else
    FocusNext;
  
end;

procedure TFrmProd_PrecoAuto.cbMargemPadraoClick(Sender: TObject);
begin
  if FIniciando then Exit;

  if cbMargemPadrao.Checked then begin
    FSaveMargem := edMargem.Value;
    Margem := null;
    edCusto.SetFocus;
  end else begin
    edMargem.Value := FSaveMargem;
    edMargem.Enabled := True;
    edMargem.SetFocus;
  end;

  AtualizaTela;    
end;

procedure TFrmProd_PrecoAuto.edCustoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    Key := 0;
    if edMargem.Enabled and (panCustoMargem.Enabled and panCustoMargem.Visible) then
      edMargem.SetFocus else
      cbAlteraPreco.SetFocus;
  end;
end;

procedure TFrmProd_PrecoAuto.edCustoPropertiesChange(Sender: TObject);
begin
  edCusto.PostEditValue;
end;

procedure TFrmProd_PrecoAuto.edCustoPropertiesEditValueChanged(Sender: TObject);
begin
  if VarIsNull(edCusto.EditValue) then
    Custo := 0 else
    Custo := edCusto.EditValue;
end;

procedure TFrmProd_PrecoAuto.edMargemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    Key := 0;
    cbAlteraPreco.SetFocus;
  end;
end;

procedure TFrmProd_PrecoAuto.edMargemPropertiesChange(Sender: TObject);
begin
  edMargem.PostEditValue;
end;

procedure TFrmProd_PrecoAuto.edMargemPropertiesEditValueChanged(
  Sender: TObject);
begin
  if VarIsNull(edMargem.EditValue) then
    Margem := 0 else
    Margem := edMargem.EditValue;
end;

procedure TFrmProd_PrecoAuto.edPrecoFocusChanged(Sender: TObject);
begin
  if TcxCustomEdit(Sender).Focused then
    TLMDSimplePanel(TControl(Sender).Parent).Color := FrmPri.FocusColor
  else begin
    if TControl(Sender).Enabled  then
      TLMDSimplePanel(TControl(Sender).Parent).Color := clWhite else
      TLMDSimplePanel(TControl(Sender).Parent).Color := clBtnFace;
  end;
end;

procedure TFrmProd_PrecoAuto.edPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (panCustoMargem.Enabled and panCustoMargem.Visible) then 
    edCusto.SetFocus;
end;

procedure TFrmProd_PrecoAuto.edPrecoPropertiesChange(Sender: TObject);
begin
  edPreco.PostEditValue;
end;

procedure TFrmProd_PrecoAuto.edPrecoPropertiesEditValueChanged(Sender: TObject);
begin
  if VarIsNull(edPreco.EditValue) then
    Preco := 0 else
    Preco := edPreco.EditValue;
end;

procedure TFrmProd_PrecoAuto.FocusFirst;
begin
  if cbAuto.Checked then begin
    if panCustoMargem.Visible and panCustoMargem.Enabled then
      edCusto.SetFocus else
      SetFocus;
  end else
    edPreco.SetFocus;
end;

procedure TFrmProd_PrecoAuto.FocusNext;
begin
  if Assigned(FOnFocusNext) then
    FOnFocusNext(Self);
end;

procedure TFrmProd_PrecoAuto.FormCreate(Sender: TObject);
begin
  FIniciando := False;
  FOnFocusNext := nil;
  FOnChange := nil;
  FSavePreco := 0;
  FSaveMargem := 0;
  FCusto := 0;
  FPreco := 0;
  panCustoMargem.Visible := Permitido(daVerCusto);
  panCustoMargem.Enabled := Permitido(daAlterarCusto);
  edPreco.Properties.ReadOnly := not Permitido(daProEditarPreco);
  cbAuto.Properties.ReadOnly := not Permitido(daProEditarPreco);
  cbAlteraPreco.Properties.ReadOnly := not Permitido(daProEditarPreco);
end;

function TFrmProd_PrecoAuto.GetCusto: Currency;
begin
  Result := FCusto;
end;

function TFrmProd_PrecoAuto.GetMargem: Variant;
begin
  if cbAuto.Checked then begin
    if cbMargemPadrao.Checked then
      Result := null else
      Result := FMargem;
  end else
    Result := FMargem;
end;

function TFrmProd_PrecoAuto.GetPrecoAuto: Boolean;
begin
  Result := cbAuto.Checked;
end;

function TFrmProd_PrecoAuto.GetPrecoVenda: Currency;
begin
  Result := FPreco;
end;

procedure TFrmProd_PrecoAuto.InitData(aPreco, aCusto: Currency;
  aMargem: Variant; aPrecoAuto, aAlteraPreco: Boolean);
begin
  FIniciando := True;
  try
    FSavePreco := aPreco;
    if aMargem<>null then
      FSaveMargem := aMargem;
    FCusto := aCusto;
    FPreco := aPreco;
    FMargem := aMargem;
    edCusto.Value := aCusto;
    edPreco.Value := aPreco;
    cbAlteraPreco.Checked := aAlteraPreco;
    cbAuto.Checked := aPrecoAuto;
    cbMargemPadrao.Checked := (aMargem=null) and (gConfig.Margem>0.001);
    AtualizaTela;
  finally
    FIniciando := False;
  end;
end;

procedure TFrmProd_PrecoAuto.lbCustoClick(Sender: TObject);
begin
  edCusto.SetFocus;
end;

procedure TFrmProd_PrecoAuto.lbDefMargemPadraoClick(Sender: TObject);
begin
  TFrmConfigPrecoAuto.Create(Self).ShowModal;
  AtualizaTela;
end;

procedure TFrmProd_PrecoAuto.lbMargemClick(Sender: TObject);
begin
  if edMargem.Enabled then
    edMargem.SetFocus;
end;

procedure TFrmProd_PrecoAuto.lbPrecoClick(Sender: TObject);
begin
  if edPreco.Enabled then
    edPreco.SetFocus;
end;

function TFrmProd_PrecoAuto.PodeAlterarPreco: Boolean;
begin
  Result := cbAlteraPreco.Checked;
end;

procedure TFrmProd_PrecoAuto.SetCusto(const Value: Currency);
begin
  if Value=FCusto then Exit;
  FCusto := Value;
  if not edCusto.Focused then
    edCusto.Value := Value;
  CalcPrecoMargem;
end;

procedure TFrmProd_PrecoAuto.SetMargem(const Value: Variant);
begin
  if Value = Margem then Exit;
  FMargem := Value;
  if not edMargem.Focused then begin
    if Value=null then
      edMargem.Clear else
      edMargem.Value := Value;
  end;
  CalcPrecoMargem;
end;

procedure TFrmProd_PrecoAuto.SetPrecoAuto(const Value: Boolean);
begin
  cbAuto.Checked := Value;
  AtualizaTela;
end;

procedure TFrmProd_PrecoAuto.SetPrecoVenda(const Value: Currency);
begin
  if Value = FPreco then Exit;
  FPreco := Value;
  if not edPreco.Focused then
    edPreco.Value := FPreco;
  CalcPrecomargem;
end;

end.
