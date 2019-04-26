unit ncaPanItensVendaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, ncMovEst;

type
  
  TBotaoItemVenda = (bivRemoverItem, bivCancelarItem);
  
  TClicouBotao = procedure (Sender: TObject; aBotao: TBotaoItemVenda) of object;
  
  TpanItensVendaBase = class(TForm)
    panPri: TLMDSimplePanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FClicouBotao : TClicouBotao;
    FResgateFidelidade : Boolean;
    procedure SetResgateFidelidade(const Value: Boolean);

    
  protected 
    FUpdating: Integer;
    function GetField(aIndex: Integer; aName: String): Variant; virtual; abstract;
    procedure SetField(aIndex: Integer; aName: String; const Value: Variant); virtual; abstract;
    function GetCount: Integer; virtual; abstract;
    procedure SetCount(const Value: Integer); virtual; abstract;
    procedure _SetResgateFidelidade; virtual; 
  public
    TipoTran: Byte;
    procedure UpdateItem(aIndex, aIDProduto: Integer; aQuant: Extended; aUnit: Double; aCancelado: Boolean); 
    procedure UpdateItemMovEst(aIndex: Integer; aItem: TncItemMovEst); 

    property Count: Integer
      read GetCount write SetCount;

    function IsUpdating: Boolean;  

    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;

    procedure SetGap(aPixels: Integer); virtual;

    procedure LoadFromItensMovEst(aItens: TncItensMovEst); 

    function FocusedItemIndex: Integer; virtual; abstract;
    
    procedure DelItem(aIndex: Integer); virtual; abstract;
    
    property  ResgateFidelidade: Boolean
      read FResgateFidelidade write SetResgateFidelidade;

    procedure Atualiza; virtual; abstract;

    procedure SetFontSize(aSize: Integer); virtual; abstract;

    procedure MostrarBotao(aBotao: TBotaoItemVenda; aMostrar: Boolean); virtual;

    property OnClicouBotao: TClicouBotao
      read FClicouBotao write FClicouBotao;

    property Values[aIndex: Integer; aName: String]: Variant
      read GetField write SetField;  
    


    { Public declarations }
  end;

var
  panItensVendaBase: TpanItensVendaBase;

implementation

uses ncaDM;

{$R *.dfm}


{ TFrmPanItensVendaBase }

procedure TpanItensVendaBase.UpdateItem(aIndex, aIDProduto: Integer;
  aQuant: Extended; aUnit: Double; aCancelado: Boolean);
begin
  if aIndex=-1 then begin
    aIndex := Count;
    Count := Count+1;
  end;
  
  with Dados do 
  if (Values[aIndex, 'IDProduto']=null) or
     (Values[aIndex, 'IDProduto']<>aIDProduto) then begin
    Values[aIndex, 'IDProduto'] := aIDProduto;
    Values[aIndex, 'Codigo'] := tbPro.Lookup('ID', aIDProduto, 'Codigo');
    Values[aIndex, 'Descr']  := tbPro.Lookup('ID', aIDProduto, 'Descricao');
  end;

  if ResgateFidelidade then begin
    Values[aIndex, 'FidPontos'] := aUnit;
    Values[aIndex, 'FidPontosTotal'] := aUnit*aQuant;
    Values[aIndex, 'Unitario'] := 0;
    Values[aIndex, 'Total'] := 0;
  end else begin
    Values[aIndex, 'Unitario'] := aUnit;
    Values[aIndex, 'Total'] := aUnit*aQuant;
    Values[aIndex, 'FidPontos'] := 0;
    Values[aIndex, 'FidPontosTotal'] := 0;
  end;
  
  Values[aIndex, 'Quant'] := aQuant;
  Values[aIndex, 'Cancelado'] := aCancelado;
end;

procedure TpanItensVendaBase.UpdateItemMovEst(aIndex: Integer; aItem: TncItemMovEst);
begin
  with aItem do
  if ResgateFidelidade then 
    UpdateItem(aIndex, imProduto, imQuant, Trunc(imFidPontos / imQuant), aItem.imCancelado) else
    UpdateItem(aIndex, imProduto, imQuant, imUnitario, aItem.imCancelado);
end;

procedure TpanItensVendaBase.BeginUpdate;
begin
  Inc(FUpdating);
end;

procedure TpanItensVendaBase.EndUpdate;
begin
  Dec(FUpdating);
end;

procedure TpanItensVendaBase.FormCreate(Sender: TObject);
begin
  FResgateFidelidade := False;
  FUpdating := 0;
  FClicouBotao := nil;
end;


function TpanItensVendaBase.IsUpdating: Boolean;
begin
  Result := (FUpdating>0);
end;

procedure TpanItensVendaBase.LoadFromItensMovEst(aItens: TncItensMovEst);
var I: Integer;
begin
  BeginUpdate;
  try
    Count := aItens.Count;
    for I := 0 to aItens.Count - 1 do
      UpdateItemMovEst(I, aItens[i]);
  finally
    EndUpdate;
  end;
end;

procedure TpanItensVendaBase.MostrarBotao(aBotao: TBotaoItemVenda;
  aMostrar: Boolean);
begin
end;

procedure TpanItensVendaBase.SetGap(aPixels: Integer);
begin

end;

procedure TpanItensVendaBase.SetResgateFidelidade(const Value: Boolean);
begin
  FResgateFidelidade := Value;
  _SetResgateFidelidade;
end;

procedure TpanItensVendaBase._SetResgateFidelidade;
begin
end;

end.
