unit ncaPanVendaProdBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmPanVendaProdBase = class;
  
  TOnAddProd = procedure (Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDesc: String; aPermSemEstoque: Boolean; aFidPontos: Double) of Object;

  TOnQuantOk = function (Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aQuant, aEstoque: Double): Boolean of object;

  TFrmPanVendaProdClass = class of TFrmPanVendaProdBase;
  
  TFrmPanVendaProdBase = class(TForm)
    panVendaProd: TLMDSimplePanel;
    procedure FormCreate(Sender: TObject);
  private
    FOnAddProd : TOnAddProd;
    FTipoTran  : Byte;
    FOnAlterouMesa: TNotifyEvent;
    FOnQuantOk : TOnQuantOk;
    FResgateFid: Boolean;
    
    { Private declarations }
    
  protected
    procedure AddProd(aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double); virtual;

    function GetMesa: Integer; virtual; 
    function GetMostrarMesa: Boolean; virtual;
    procedure SetMesa(const Value: Integer); virtual; 
    procedure SetMostrarMesa(const Value: Boolean); virtual;    
    procedure SetTipoTran(const Value: Byte); virtual;
  public
    procedure AfterConstruction; override;

    procedure SetGap(aPixels: Integer); virtual;

    property TipoTran: Byte
      read FTipoTran write SetTipoTran;

    procedure Clear; virtual; abstract;
    procedure ClosePops; virtual;
    procedure FocusProd; virtual; abstract;
    procedure FocusMesa; virtual;
    function CanCloseForm: Boolean; virtual; abstract;

    property OnAlterouMesa: TNotifyEvent
      read FOnAlterouMesa write FOnAlterouMesa;

    property Mesa: Integer
      read GetMesa write SetMesa;

    property MostrarMesa: Boolean
      read GetMostrarMesa write SetMostrarMesa;    
    { Public declarations }
  published  
    property OnAddProd: TOnAddProd 
      read FOnAddProd write FOnAddProd;

    property OnQuantOk: TOnQuantOk
      read FOnQuantOk write FOnQuantOk;  

    property ResgateFid: Boolean
      read FResgateFid write FResgateFid;  
  end;

var
  FrmPanVendaProdBase: TFrmPanVendaProdBase;
  DefPanVendaProdClass : TFrmPanVendaProdClass = nil;

implementation

{$R *.dfm}

{ TFrmPanVendaProdBase }

procedure TFrmPanVendaProdBase.AddProd(aProdID: Cardinal; aValorUnit, aTotal: Currency;
  aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);
begin
  if Assigned(FOnAddProd) then FOnAddProd(Self, aProdID, aValorUnit, aTotal, aQuant, aDescr, aPermSemEstoque, aFidPontos);
end;

procedure TFrmPanVendaProdBase.AfterConstruction;
begin
  inherited;
  FOnQuantOk := nil;
  FOnAddProd := nil;
end;

procedure TFrmPanVendaProdBase.ClosePops;
begin

end;

procedure TFrmPanVendaProdBase.FocusMesa;
begin

end;

procedure TFrmPanVendaProdBase.FormCreate(Sender: TObject);
begin
  FResgateFid := False;
end;

function TFrmPanVendaProdBase.GetMesa: Integer;
begin
  Result := 0;
end;

function TFrmPanVendaProdBase.GetMostrarMesa: Boolean;
begin
  Result := False;
end;

procedure TFrmPanVendaProdBase.SetGap(aPixels: Integer);
begin

end;

procedure TFrmPanVendaProdBase.SetMesa(const Value: Integer);
begin

end;

procedure TFrmPanVendaProdBase.SetMostrarMesa(const Value: Boolean);
begin

end;

procedure TFrmPanVendaProdBase.SetTipoTran(const Value: Byte);
begin
  FTipoTran := Value;
end;

end.
