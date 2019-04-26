unit ncaFrmProduto_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxCheckBox, cxLabel, cxTextEdit, cxCurrencyEdit,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDGraph;

type
  TFrmProd_Estoque = class(TForm)
    panPri: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    panInner: TLMDSimplePanel;
    cbNaoControlar: TcxCheckBox;
    panAtual: TLMDSimplePanel;
    edAtual: TcxCurrencyEdit;
    lbAtual: TcxLabel;
    cbFracao: TcxCheckBox;
    lbLimites2: TcxLabel;
    panMax: TLMDSimplePanel;
    edMax: TcxCurrencyEdit;
    lbMax: TcxLabel;
    panMin: TLMDSimplePanel;
    edMin: TcxCurrencyEdit;
    lbMin: TcxLabel;
    lbLimites: TcxLabel;
    procedure edAtualFocusChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbNaoControlarClick(Sender: TObject);
    procedure edAtualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNaoControlarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMinKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMaxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edAtualPropertiesChange(Sender: TObject);
    procedure edMinPropertiesChange(Sender: TObject);
    procedure edMaxPropertiesChange(Sender: TObject);
    procedure edAtualPropertiesEditValueChanged(Sender: TObject);
  private
    FOnFocusNext: TNotifyEvent;
    FOnChange: TNotifyEvent;
    Finiciando: Boolean;
    
    procedure AtualizaTela;
    procedure CheckESC(var aKey: Word);
    { Private declarations }
  public
  
    procedure InitData(aNaoControlar, aFracao: Boolean; aEstoque, aMin, aMax: Double);

    procedure FocusFirst;

    function NaoControlar: Boolean;

    function Fracao: Boolean;

    function Estoque: Double;

    function Minimo: Double;

    function Maximo: Double;

    property OnFocusNext: TNotifyEvent
      read FOnFocusNext write FOnFocusNext;

    property OnChange: TNotifyEvent
      read FOnChange write FOnChange;  
    { Public declarations }
  end;

var
  FrmProd_Estoque: TFrmProd_Estoque;

implementation

uses ncaFrmPri, ncaDM, ncIDRecursos, ncaFrmProduto;

{$R *.dfm}

{ TFrmProduto_Estoque }

procedure TFrmProd_Estoque.AtualizaTela;
begin
  edAtual.Enabled := not cbNaoControlar.Checked;
  edMin.Enabled := not cbNaoControlar.Checked;
  edMax.Enabled := not cbNaoControlar.Checked;
  cbFracao.Enabled := edMin.Enabled;
  lbAtual.Enabled := edAtual.Enabled;
  lbMin.Enabled := edAtual.Enabled;
  lbMax.Enabled := edAtual.Enabled;
  lbLimites.Enabled := edAtual.Enabled;
  lbLimites2.Enabled := edAtual.Enabled;
  if not edAtual.Enabled then begin
    panAtual.Color := clBtnFace;
    panMin.Color := clBtnFace;
    panMax.Color := clBtnFace;
  end else begin
    if edAtual.Focused then
      panAtual.Color := FrmPri.FocusColor else
      panAtual.Color := clWhite;

    if edMin.Focused then
      panMin.Color := FrmPri.FocusColor else
      panMin.Color := clWhite;

    if edMax.Focused then
      panMax.Color := FrmPri.FocusColor else
      panMax.Color := clWhite;
  end;
end;

procedure TFrmProd_Estoque.cbNaoControlarClick(Sender: TObject);
begin
  if FIniciando then Exit;
  AtualizaTela;
  FOnChange(Self);
end;

procedure TFrmProd_Estoque.cbNaoControlarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckEsc(Key);
  if (Key=13) then
  if edAtual.Enabled then
    edAtual.SetFocus else
    FOnFocusNext(Self);
end;

procedure TFrmProd_Estoque.CheckESC(var aKey: Word);
begin
  if aKey = Key_ESC then begin
    aKey := 0;
    TFrmProduto(Owner).edEstoque.DroppedDown := False;
  end;
  if aKey = Key_F2 then begin
    aKey := 0;
    TFrmProduto(Owner).TentaGravar;
  end;
end;

procedure TFrmProd_Estoque.edAtualFocusChanged(Sender: TObject);
begin
  with TcxCustomEdit(Sender) do 
  if Focused then 
    TLMDSimplePanel(Parent).Bevel.BorderColor := clBlue else
    TLMDSimplePanel(Parent).Bevel.BorderColor := clSilver;
    
end;

procedure TFrmProd_Estoque.edAtualKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckEsc(Key);
  if Key=13 then
    edMin.SetFocus;
end;

procedure TFrmProd_Estoque.edAtualPropertiesChange(Sender: TObject);
begin
  edAtual.PostEditValue;
end;

procedure TFrmProd_Estoque.edAtualPropertiesEditValueChanged(Sender: TObject);
begin
  if FIniciando then Exit;
  FOnChange(Self);
end;

procedure TFrmProd_Estoque.edMaxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckEsc(Key);
  if Key=13 then FOnFocusNext(Sender);
end;

procedure TFrmProd_Estoque.edMaxPropertiesChange(Sender: TObject);
begin
  edMax.PostEditValue;
end;

procedure TFrmProd_Estoque.edMinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckEsc(Key);
  if Key=13 then
    edMax.SetFocus;
end;

procedure TFrmProd_Estoque.edMinPropertiesChange(Sender: TObject);
begin
  edMin.PostEditValue;
end;

function TFrmProd_Estoque.Estoque: Double;
begin
  if edAtual.EditValue<>null then
    Result := edAtual.EditValue else
    Result := 0;
end;

procedure TFrmProd_Estoque.FocusFirst;
begin
  if edAtual.Enabled then
    edAtual.SetFocus else
    cbNaoControlar.SetFocus;
end;

procedure TFrmProd_Estoque.FormCreate(Sender: TObject);
begin
  FIniciando := False;
  cbNaoControlar.Properties.ReadOnly := not Permitido(daProEditarPreco);
end;

function TFrmProd_Estoque.Fracao: Boolean;
begin
  Result := cbFracao.Checked;
end;

procedure TFrmProd_Estoque.InitData(aNaoControlar, aFracao: Boolean; aEstoque, aMin,
  aMax: Double);
begin
  FIniciando := True;
  try
    cbNaoControlar.Checked := aNaoControlar;
    cbFracao.Checked := aFracao;
    edAtual.Value := aEstoque;
    edMin.Value := aMin;
    edMax.Value := aMax;
    AtualizaTela;
  finally
    FIniciando := False;
  end;
end;

function TFrmProd_Estoque.Maximo: Double;
begin
  if edMax.EditValue=null then
    Result := 0 else
    Result := edMax.EditValue;
end;

function TFrmProd_Estoque.Minimo: Double;
begin
  if edMin.EditValue=null then
    Result := 0 else
    Result := edMin.EditValue;
end;

function TFrmProd_Estoque.NaoControlar: Boolean;
begin
   Result := cbNaoControlar.Checked;
end;

end.
