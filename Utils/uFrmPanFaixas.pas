unit uFrmPanFaixas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  StdCtrls, cxButtons, LMDControl, uFrmPanFaixa,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, LMDCustomComponent,
  LMDWndProcComponent, LMDFlyoutController, LMDFlowPanel, cxClasses;

type
  TFaixaItem = record
    fiDe, fiAte: Integer;
  end;

  TArrayFaixa = Array of TFaixaItem;
  
  TFrmFaixas = class(TForm)
    panPri: TLMDSimplePanel;
    panItens: TLMDSimplePanel;
    Timer1: TTimer;
    lbAdd: TcxLabel;
    Fly: TLMDFlyoutController;
    cxEditStyleController1: TcxEditStyleController;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FMinimo: Integer;
    FMaximo: Integer; 
    FDefDe, FDefAte: Variant;
    FItens : TList;
    FOrig: String;
    FDestroying: Boolean;
    FHabilitar: Boolean;
    FStyle : TcxEditStyleController;
    procedure CalcHeight;
    procedure SetMaximo(const Value: Integer);
    procedure SetMinimo(const Value: Integer);
    procedure OnDestroyItem(Sender: TObject);
    function MostrarApagar(Sender: TObject): Boolean;
    function GetFaixa(aIndex: Integer): TFrmPanFaixa;

    function CoincideFaixa(aIndex, aInicio, aFim: Integer): Boolean;


    function GetIndexOrdem(aInicio, aIndex: Integer): Integer;

    procedure Ordena(aIndex: Integer);

    procedure OnAlterouInicio(Sender: TObject);
    function GetString: String;
    procedure SetString(const Value: String);
  public
    function Alterou: Boolean;
    
    function DentroFaixa(aNum: Integer): Boolean;

    function ValidaItem(aIndex: Integer; aRaiseException: Boolean): Boolean;

    function Valida(aRaiseException: Boolean = True): Boolean;
    
    function Add: TFrmPanFaixa;

    function Count: Integer;

    procedure Habilitar(aEnabled: Boolean);

    property AsString: String
      read GetString write SetString;

    property Style: TcxEditStyleController
      read FStyle write FStyle;

    property Faixas[aIndex: Integer]: TFrmPanFaixa
      read GetFaixa;

    procedure Clear; 

    property DefDe: variant
      read FDefDe write FDefDe;

    property DefAte: variant
      read FDefAte write FDefAte;

    property Minimo: Integer
      read FMinimo write SetMinimo;

    property Maximo: Integer
      read FMaximo write SetMaximo;  
    { Public declarations }
  end;

var
  FrmFaixas: TFrmFaixas;

implementation

{$R *.dfm}

{ TFrmFaixas }

resourcestring
  SNumeroNaoPodeRepetir = 'Numeração não pode repetir';
  SNumeroForaFaixa = 'Número deve estar entre %d e %d';
  SNumeroFinalDeveSerMaior = 'Número final deve ser maior que inicial';
  SVazio = 'É necessário informar o número inicial e final';

function TFrmFaixas.Alterou: Boolean;
begin
  Result := (AsString<>FOrig);
end;

procedure TFrmFaixas.btnAdicionarClick(Sender: TObject);
begin
  with Add do begin
    edI.EditValue := FDefDe;
    edF.EditValue := FDefAte;
    edI.SetFocus;
  end;
end;

procedure TFrmFaixas.CalcHeight;
begin
  panItens.Height := FItens.Count*34;
  lbAdd.Top := panItens.Height+3;
  if Count>0 then
    lbAdd.Left := Faixas[0].edI.Left;
end;

procedure TFrmFaixas.Clear;
begin
  while FItens.Count>0 do 
    TObject(FItens[0]).Free;
end;

function TFrmFaixas.CoincideFaixa(aIndex, aInicio, aFim: Integer): Boolean;
var i: integer;
begin
  Result := True;
  for I := 0 to Count - 1 do with Faixas[I] do 
    if (I<>aIndex) and (((aInicio>=Inicio) and (aInicio<=Fim)) or ((aFim>=Inicio) and (aFim<=Fim)) ) then begin
       edI.SetFocus;
       Exit;
    end;
  Result := False;
end;

function TFrmFaixas.Count: Integer;
begin
  Result := FItens.Count;
end;

procedure TFrmFaixas.cxButton1Click(Sender: TObject);
begin
  Caption := AsString;
  Valida;
end;

function TFrmFaixas.DentroFaixa(aNum: Integer): Boolean;
var i: integer;
begin
  for I := 0 to Count - 1 do with Faixas[i] do 
    if MaiorQueZero and ValidaItem(i, False) and (aNum>=Inicio) and (aNum<=Fim) then begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

procedure TFrmFaixas.FormCreate(Sender: TObject);
begin
  FHabilitar := True;
  FStyle := nil;
  FItens := TList.Create;
  FDefDe := null;
  FDefAte := null;
  FMinimo := 1;
  FMaximo := 999;
  FDestroying := False;
  SetLength(FOrig, 0);
  CalcHeight;
end;

procedure TFrmFaixas.FormDestroy(Sender: TObject);
begin
  FDestroying := True;
  Clear;
  FItens.Free;
end;

procedure TFrmFaixas.FormShow(Sender: TObject);
begin
  AsString := '1-20,21-50,60,70,71-100';
end;

function TFrmFaixas.GetFaixa(aIndex: Integer): TFrmPanFaixa;
begin
  Result := TFrmPanFaixa(FItens[aIndex]);
end;

function TFrmFaixas.GetIndexOrdem(aInicio, aIndex: Integer): Integer;
var i: integer;
begin
  for i := 0 to Count-1 do 
    if (i<>aIndex) then
      if aInicio<=Faixas[i].Inicio then begin
        if aIndex=(i-1) then
          Result := aIndex else
          Result := i;
        Exit;
      end;
  Result := i;    
end;

function TFrmFaixas.GetString: String;
var I: Integer;
begin
  Result := '';
  for I := 0 to Count-1 do with Faixas[I] do 
    if MaiorQueZero and ValidaItem(I, False) then begin
      if Result>'' then Result := Result + ',';
      Result := Result + IntToStr(Inicio);
      if Fim>Inicio then Result := Result +'-' + IntToStr(Fim);
    end;  
end;

procedure TFrmFaixas.Habilitar(aEnabled: Boolean);
var I: Integer;
begin
  FHabilitar := aEnabled;
  lbAdd.Enabled := aEnabled;
  for I := 0 to Count - 1 do Faixas[I].Habilitar(aEnabled);
end;

function TFrmFaixas.MostrarApagar(Sender: TObject): Boolean;
begin
  Result := (FItens.Count>1);
end;

procedure TFrmFaixas.OnAlterouInicio(Sender: TObject);
var I : Integer;
begin
  if Count<2 then Exit;
  if TFrmPanFaixa(Sender).edI.EditValue=null then Exit;


  I := FItens.IndexOf(Sender);
  if I>=0 then Ordena(I);
end;

procedure TFrmFaixas.OnDestroyItem(Sender: TObject);
var I : Integer;
begin
  I := FItens.IndexOf(Sender);
  FItens.Remove(Sender);
  if not FDestroying then begin
    while (I>0) and (I>=FItens.Count) do Dec(I);
    if I<FItens.Count then
      TFrmPanFaixa(FItens[I]).edI.SetFocus;
    Timer1.Enabled := True;
  end;
end;

procedure TFrmFaixas.Ordena(aIndex: Integer);
var 
  I: Integer;
  A: TFrmPanFaixa;
begin
  if (Count<2) or (Faixas[aIndex].Inicio=null) then Exit;
  I := GetIndexOrdem(Faixas[aIndex].Inicio, aIndex);
  if I=aIndex then Exit;

  A := Faixas[aIndex];

  FItens.Remove(A);

  if I>aIndex then Dec(I);
  

  if I>=Count then begin
    FItens.Add(A);
    I := FItens.Count-1;
  end else
    FItens.Insert(I, A);
  
  if aIndex<I then
    A.panPri.Top := (I*A.panPri.Height) + 5 else
    A.panPri.Top := (I*A.panPri.Height) - 5;
end;

procedure TFrmFaixas.SetMaximo(const Value: Integer);
begin
  FMaximo := Value;
end;

procedure TFrmFaixas.SetMinimo(const Value: Integer);
begin
  FMinimo := Value;
end;

procedure TFrmFaixas.SetString(const Value: String);
var 
  S, Prox: String;
  I, F: Integer;

function Proximo: String;
var P: Integer;
begin
  P := Pos(',', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;
  Result := Trim(Result);
end;  

function CalcIF(Str: String): Boolean;
var P: Integer;
begin
  F := 0;
  I := 0;
  P := Pos('-', Str);
  if P>0 then begin
    I := StrToIntDef(Trim(Copy(Str, 1, P-1)), 0);
    F := StrToIntDef(Trim(Copy(Str, P+1, 100)), 0);
  end else begin
    I := StrToIntDef(Trim(Str), 0);
    F := I;
  end;
  Result := (I>0) and (F>=I);
end;

begin
  FOrig := S;
  S := Value;
  repeat
    Prox := Proximo;
    if (prox>'') and CalcIF(Prox) then with Add do begin
      edI.EditValue := I;
      edF.EditValue := F;
    end;
  until S='';
end;

procedure TFrmFaixas.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  CalcHeight;
end;

function TFrmFaixas.Valida(aRaiseException: Boolean = True): Boolean;
var i, C: integer;
begin
  Result := False;
  C := 0;
  for I := 0 to Count-1 do with Faixas[I] do 
    if MaiorQueZero then begin
      if not ValidaItem(I, aRaiseException) then Exit;
      Inc(C);
    end;
    
  if (C=0) then begin
    if aRaiseException then
      raise exception.Create(SVazio);
    Exit;
  end;
  
  Result := True
end;

function TFrmFaixas.ValidaItem(aIndex: Integer;
  aRaiseException: Boolean): Boolean;
var i: integer;
begin
  Result := False;
  i := aIndex;
  with Faixas[I] do begin
    if not Faixas[I].Valido then begin
      edF.SetFocus;
      if aRaiseException then
        raise exception.Create(SNumeroFinalDeveSerMaior);
      Exit;  
    end;
    
    if CoincideFaixa(I, Inicio, Fim) then begin
      if aRaiseException then
        Raise exception.Create(SNumeroNaoPodeRepetir);
      Exit;
    end;
    
    if (Inicio<Minimo) or (Inicio>Maximo) then begin
      edI.SetFocus;
      if aRaiseException then
        raise exception.Create(Format(SNumeroForaFaixa, [FMinimo, FMaximo]));
      Exit;
    end;

    if (Fim<Minimo) or (Fim>Maximo) then begin
      edF.SetFocus;
      if aRaiseException then
        raise exception.Create(Format(SNumeroForaFaixa, [FMinimo, FMaximo]));
      Exit;
    end;
  end;
  Result := True
end;

function TFrmFaixas.Add: TFrmPanFaixa;
begin
  Result := TFrmPanFaixa.Create(Self);
  FItens.Add(Result);
  Result.MostrarApagar := MostrarApagar;
  Result.OnDestroy := OnDestroyItem;
  Result.panPri.Parent := panItens;
  Result.panPri.Top := 10000;
  Result.OnAlterouInicio := OnAlterouInicio;
  Result.edI.Style.StyleController := FStyle;
  Result.edF.Style.StyleController := FStyle;
  Result.Habilitar(FHabilitar);
  
  Result.edI.Properties.MinValue := FMinimo;
  Result.edI.Properties.MaxValue := FMaximo;

  Result.edF.Properties.MinValue := FMinimo;
  Result.edF.Properties.MaxValue := FMaximo;
  
  Timer1.Enabled := True;
end;

end.
