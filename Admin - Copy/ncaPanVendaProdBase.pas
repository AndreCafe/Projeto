unit ncaPanVendaProdBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmPanVendaProdBase = class;
  
  TOnAddProd = procedure (Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit: Currency; aQuant: Extended; aDesc: String) of Object;
  
  TFrmPanVendaProdClass = class of TFrmPanVendaProdBase;
  
  TFrmPanVendaProdBase = class(TForm)
    panVendaProd: TLMDSimplePanel;
  private
    FOnAddProd : TOnAddProd;
    FTipoTran  : Byte;
    FOnAlterouMesa: TNotifyEvent;
    
    { Private declarations }
    
  protected
    procedure AddProd(aProdID: Cardinal; aValorUnit: Currency; aQuant: Extended; aDescr: String); virtual;

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
  end;

var
  FrmPanVendaProdBase: TFrmPanVendaProdBase;
  DefPanVendaProdClass : TFrmPanVendaProdClass = nil;

implementation

{$R *.dfm}

{ TFrmPanVendaProdBase }

procedure TFrmPanVendaProdBase.AddProd(aProdID: Cardinal; aValorUnit: Currency;
  aQuant: Extended; aDescr: String);
begin
  if Assigned(FOnAddProd) then FOnAddProd(Self, aProdID, aValorUnit, aQuant, aDescr);
end;

procedure TFrmPanVendaProdBase.AfterConstruction;
begin
  inherited;
  FOnAddProd := nil;
end;

procedure TFrmPanVendaProdBase.FocusMesa;
begin

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
