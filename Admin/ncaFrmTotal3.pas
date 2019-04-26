unit ncaFrmTotal3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, cxMemo, dxGDIPlusClasses,
  ExtCtrls, LMDBaseEdit, LMDCustomMemo, LMDMemo, ncEspecie, ImgList, ncMyImage;

type
  TFrmTotal3 = class(TForm)
    panTot: TLMDSimplePanel;
    panValor: TLMDSimplePanel;
    lbTotal: TcxLabel;
    lbEditPagamento: TcxLabel;
    lbEditObs: TcxLabel;
    lbEditDesconto: TcxLabel;
    panDesconto: TLMDSimplePanel;
    panPontos: TLMDSimplePanel;
    lbPontosDisp: TcxLabel;
    lbPontosNec: TcxLabel;
    imgs: TcxImageList;
    panDesc2: TLMDSimplePanel;
    lbDesconto: TcxLabel;
    lbPromptDesconto: TcxLabel;
    panDesc1: TLMDSimplePanel;
    lbSubTotal: TcxLabel;
    cxLabel3: TcxLabel;
    lbObs: TcxLabel;
    procedure panTotResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbEditObsClick(Sender: TObject);
    procedure lbEditDescontoClick(Sender: TObject);
  private
    FDesconto: Currency;
    FDescPorPerc : Boolean;
    FDescPerc : Double;
    
    FPontosNec: Double;
    FPontosDisp: Double;
    FFidResgate: Boolean;
    FPagEsp : TncPagEspecies;
    FOpPagto: Byte;
    FRecebido: Currency;
    procedure SetSubTotal(const Value: Currency);
    procedure SetPontosNec(const Value: Double);

    procedure SetPontosDisp(const Value: Double);
    procedure SetFidResgate(const Value: Boolean);
    procedure SetObs(const Value: String);
    function GetObs: String;
    procedure SetDesconto(const Value: Currency);
    procedure SetOpPagto(const Value: Byte);
    procedure SetRecebido(const Value: Currency);
    function GetSubTotal: Currency;
    procedure SetDescPerc(const Value: Double);
    procedure SetDescPorPerc(const Value: Boolean);
    { Private declarations }
  public
    procedure InitVal(aPagEsp: TncPagEspecies; aSubTot, aDesconto, aPago, aRecebido : Double; aObs: String; aParent: TWinControl; aShowObs: Boolean = True);
    procedure InitPontos(aNec, aDisp: Double; aObs: String; aParent: TWinControl; aShowObs: Boolean = True);
    procedure InitCusto(aPagEsp: TncPagEspecies; aCusto: Double; aObs: String; aParent: TWinControl; aShowObs: Boolean = True);

    procedure Atualiza;
    procedure AlteraParent(aParent: TWinControl);

    procedure EditObs;
    procedure EditDesc;

    function Total: Currency;

    function calcDesconto: Currency;
    function calcPerc: Double;

    function EditarPagEsp: Boolean;

    procedure SetPagEsp(aPagEsp: TncPagEspecies);
    
    property SubTotal: Currency read GetSubTotal write SetSubTotal;
    
    property Desconto: Currency read FDesconto write SetDesconto;
    property DescPerc: Double read FDescPerc write SetDescPerc;
    property DescPorPerc: Boolean read FDescPorPerc write SetDescPorPerc;

    property PontosNec: Double read FPontosNec write SetPontosNec;
    property PontosDisp: Double read FPontosDisp write SetPontosDisp;

    property FidResgate: Boolean read FFidResgate write SetFidResgate;

    property Recebido: Currency read FRecebido write SetRecebido;
     

    property Obs: String read GetObs write SetObs;

    property OpPagto: Byte read FOpPagto write SetOpPagto;
     

    { Public declarations }
  end;

var
  FrmTotal3: TFrmTotal3;

resourcestring
  rsPontosNec = 'Pontos Necessários';
  rsPontosDisp = 'Pontos Disponíveis';  
  rsTotal = 'Total';
  rsSubTotal = 'Sub-Total';
  rsDesconto = 'Desconto';

implementation

uses ncClassesBase, ncaFrmObs, ncaFrmEditObs, ncaFrmEditDesc;

{$R *.dfm}

function PontosToStr(P: Double): String;
begin
  Str((Int(P*10)/10):10:1, Result);
  Result := Trim(Result);
  if Pos('.', Result)>0 then 
    while (Result>'') and (Result[Length(Result)] in ['0']) do Delete(Result, Length(Result), 1);
  if Result[Length(Result)]='.' then Delete(Result, Length(Result), 1);
end;

procedure TFrmTotal3.AlteraParent(aParent: TWinControl);
begin
  panTot.Parent := aParent;
  aParent.Height := panTot.Height;
end;

procedure TFrmTotal3.Atualiza;
var ObsH, DescH: Integer;
begin
  lbPontosNec.Caption := rsPontosNec + ' = ' + PontosToStr(FPontosNec);
  lbPontosDisp.Caption := rsPontosDisp + ' = ' + PontosToStr(FPontosDisp);
  if FPontosDisp>=FPontosNec then
    lbPontosDisp.Style.TextColor := clGreen else
    lbPontosDisp.Style.TextColor := clRed;

  lbSubTotal.Caption := CurrencyToStr(SubTotal);

  lbPromptDesconto.Caption := rsDesconto + ' ('+PercToStr(calcPerc)+') =';

  lbDesconto.Caption := CurrencyToStr(FDesconto);
  lbTotal.Caption := rsTotal + ' = ' + CurrencyToStr(Total);
//  lbTotal.Caption := rsTotal + ' * ' + FloatToStrF(Total, ffCurrency, 15, CurrencyDecimals);

  lbObs.Visible := (Obs>'');
  lbEditObs.Visible := (Obs='');
  panDesconto.Visible := (FDesconto>0.0001);

  panPontos.Visible := FidResgate;
  panValor.Visible := not FidResgate;

  if (not FidResgate) and (FDesconto>0) then
    DescH := panDesconto.Height;
    DescH := 0;

  panDesconto.Top := ObsH;
  panValor.Top := 1000;
  panPontos.Top := ObsH;

  panTot.Parent.Height := panTot.Height;
end;

function TFrmTotal3.calcDesconto: Currency;
begin
  if FDescPorPerc then 
    Result := DuasCasas(FPagEsp.TotalPagar * (FDescPerc/100)) else
    Result := FDesconto;
end;

function TFrmTotal3.calcPerc: Double;
begin
  if not Assigned(FPagEsp) then
    Result := 0
  else
  if FDescPorPerc then
    Result := FDescPerc 
  else
    Result := FDesconto / FPagEsp.TotalPagar * 100;
end;

function TFrmTotal3.EditarPagEsp: Boolean;
var 
  P : TncPagEspecies;
  C, D, Desc: Currency;
begin
{  P := TncPagEspecies.Create;
  try
    P.Assign(FPagEsp);
    Desc := FME.Desconto;
    C := FCredUsado + FCli.Credito;
    if (FCredUsado>0) and (C<FCredUsado) then C := FCredUsado;

    if not FNovo then
      D := 0 else
      D := FCli.Debito;
    
    Result := TFrmPagEspecie.Create(Self).Editar(FNovo, P, FTot.SubTotal, C, D, Desc);
    if Result then begin
      FME.Desconto := Desc;
      FME.PagEsp.Assign(P);
    end;
  finally
    P.Free;
  end;}
end;

procedure TFrmTotal3.EditDesc;
var 
  aDescPerc: Double; 
  aDescPorPerc: Boolean;
  Desc: Currency;
begin
  aDescPerc := DescPerc;
  aDescPorPerc := DescPorPerc;
  Desc := Desconto;
  if TFrmEditDesc.Create(Self).Editar(SubTotal, Desc, aDescPerc, aDescPorPerc) then begin
    Desconto := Desc;
    Descperc := aDescPerc;
    DescPorPerc := aDescPorPerc;
  end;
end;

procedure TFrmTotal3.EditObs;
begin
  Obs := TFrmEditObs.Create(Self).Editar(Obs);
end;

procedure TFrmTotal3.FormCreate(Sender: TObject);
begin
  FPontosNec := 0;
  FPontosDisp := 0;
  FFidResgate := False;
  FDesconto := 0;
  FDescPerc := 0;
  FDescPorPerc := False;
  lbObs.Caption := '';
  Atualiza;
end;

function TFrmTotal3.GetObs: String;
begin
  Result := lbObs.Caption;
end;

function TFrmTotal3.GetSubTotal: Currency;
begin
  if FPagEsp=nil then 
    Result := 0 else
    Result := FPagEsp.TotalPagar;
end;

procedure TFrmTotal3.InitCusto(aPagEsp: TncPagEspecies; aCusto: Double; aObs: String;
  aParent: TWinControl; aShowObs: Boolean);
begin
  FPagEsp := aPagEsp;
  AlteraParent(aParent);
  lbEditPagamento.Visible := False;
  lbEditObs.Visible := (aObs>'') or aShowObs;
  Obs := aObs;
  SubTotal := aCusto;
  FidResgate := False;
end;

procedure TFrmTotal3.InitPontos(aNec, aDisp: Double; aObs: String;
  aParent: TWinControl; aShowObs: Boolean);
begin
  FPagEsp := nil;
  AlteraParent(aParent);
  FidResgate := True;
  lbEditDesconto.Visible := False;
  lbEditPagamento.Visible := False;
  lbEditObs.Visible := (aObs>'') or aShowObs;
  PontosNec := aNec;
  PontosDisp := aDisp;
  Obs := aObs;
end;

procedure TFrmTotal3.InitVal(aPagEsp: TncPagEspecies; aSubTot, aDesconto, aPago, aRecebido: Double;
  aObs: String; aParent: TWinControl; aShowObs: Boolean);
begin
  FPagEsp := aPagEsp;
  AlteraParent(aParent);
  FidResgate := False;
  lbEditDesconto.Visible := True;
  lbEditPagamento.Visible := True;
  lbEditObs.Visible := (aObs>'') or aShowObs;
  SubTotal := aSubTot;
  Desconto := aDesconto;
  Obs := aObs;
end;

procedure TFrmTotal3.lbEditDescontoClick(Sender: TObject);
begin
  EditDesc;
end;

procedure TFrmTotal3.lbEditObsClick(Sender: TObject);
begin
  EditObs;
end;

procedure TFrmTotal3.panTotResize(Sender: TObject);
begin
  panTot.Parent.Height := panTot.Height;
end;

procedure TFrmTotal3.SetDesconto(const Value: Currency);
begin
  FDesconto := Value;
  Atualiza;
end;

procedure TFrmTotal3.SetDescPerc(const Value: Double);
begin
  if Value<>FDescPerc then begin
    FDescPerc := Value;
    Atualiza;
  end;
end;

procedure TFrmTotal3.SetDescPorPerc(const Value: Boolean);
begin
  if Value<>FDescPorPerc then begin
    FDescPorPerc := Value;
    Atualiza;
  end;
end;

procedure TFrmTotal3.SetFidResgate(const Value: Boolean);
begin
  FFidResgate := Value;
  Atualiza;
end;

procedure TFrmTotal3.SetObs(const Value: String);
begin
  lbObs.Caption := Value;
  if FPagEsp<>nil then
    FPagEsp.Obs := Value;
  Atualiza;
end;

procedure TFrmTotal3.SetOpPagto(const Value: Byte);
begin
  FOpPagto := Value;
end;

procedure TFrmTotal3.SetPagEsp(aPagEsp: TncPagEspecies);
begin
  FPagEsp := aPagEsp;
  Atualiza;
end;

procedure TFrmTotal3.SetPontosDisp(const Value: Double);
begin
  FPontosDisp := Value;
  Atualiza;
end;

procedure TFrmTotal3.SetPontosNec(const Value: Double);
begin
  FPontosNec := Value;
  Atualiza;
end;

procedure TFrmTotal3.SetRecebido(const Value: Currency);
begin
  FRecebido := Value;
end;

procedure TFrmTotal3.SetSubTotal(const Value: Currency);
begin
  if FPagEsp<>nil then begin
    FPagEsp.TotalPagar := Value;
    Atualiza;
  end;
end;

function TFrmTotal3.Total: Currency;
begin
  if FPagEsp<>nil then 
    Result := FPagEsp.TotalPagar - calcDesconto else
    Result := 0;
end;


end.
