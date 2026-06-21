unit uFrmPanFaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, 
  Menus, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TMostrarApagar= function (Sender: TObject): Boolean of object;
  
  TFrmPanFaixa = class(TForm)
    panPri: TLMDSimplePanel;
    lbDe: TcxLabel;
    edI: TcxMaskEdit;
    edF: TcxMaskEdit;
    lbAte: TcxLabel;
    btnApagar: TcxButton;
    procedure btnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edIEnter(Sender: TObject);
    procedure edIExit(Sender: TObject);
    procedure edFEnter(Sender: TObject);
    procedure edFExit(Sender: TObject);
    procedure panPriClick(Sender: TObject);
    procedure edIPropertiesChange(Sender: TObject);
    procedure edFPropertiesChange(Sender: TObject);
    procedure edIPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FMostrarApagar: TMostrarApagar;
    FOnAlterouInicio : TNotifyEvent;
    function _MostrarApagar: Boolean;
    function GetInicio: variant;
    procedure SetInicio(const Value: variant);
    function GetFim: variant;
    procedure SetFim(const Value: variant);
  public
    procedure Habilitar(aEnabled: Boolean);
    property MostrarApagar: TMostrarApagar
      read FMostrarApagar write FMostrarApagar;

    property OnAlterouInicio  : TNotifyEvent
      read FOnAlterouInicio write FOnAlterouInicio;

    property Inicio: variant
      read GetInicio write SetInicio;

    property Fim: variant
      read GetFim write SetFim; 

    function Valido: Boolean;

    function MaiorQueZero: Boolean;  
  
    { Public declarations }
  end;

var
  FrmPanFaixa: TFrmPanFaixa;

implementation

{$R *.dfm}

procedure TFrmPanFaixa.btnApagarClick(Sender: TObject);
begin
  Free;
end;

procedure TFrmPanFaixa.edFEnter(Sender: TObject);
begin
  btnApagar.Visible := _MostrarApagar;
  panPri.Color := $00F0F0F0;
end;

procedure TFrmPanFaixa.edFExit(Sender: TObject);
begin
  btnApagar.Visible := edI.Focused and _MostrarApagar;
  if not edI.Focused then panPri.Color := clWhite;

end;

procedure TFrmPanFaixa.edFPropertiesChange(Sender: TObject);
begin
  edF.PostEditValue;
end;

procedure TFrmPanFaixa.edIEnter(Sender: TObject);
begin
  btnApagar.Visible := _MostrarApagar;
  panPri.Color := $00F0F0F0;
end;

procedure TFrmPanFaixa.edIExit(Sender: TObject);
begin
  btnApagar.Visible := edF.Focused and _MostrarApagar;
  if not edF.Focused then panPri.Color := clWhite;
  
end;

procedure TFrmPanFaixa.edIPropertiesChange(Sender: TObject);
begin
  edI.PostEditValue;
end;

procedure TFrmPanFaixa.edIPropertiesEditValueChanged(Sender: TObject);
begin
  try FOnAlterouInicio(Self); except end;
end;

procedure TFrmPanFaixa.FormCreate(Sender: TObject);
begin
  FMostrarApagar := nil;
end;

function TFrmPanFaixa.GetFim: variant;
begin
  if edF.EditValue=null then
    Result := 0
  else
    try
      Result := edF.EditValue
    except
      Result := 0;
    end;
end;

function TFrmPanFaixa.GetInicio: variant;
begin
  if edI.EditValue=null then
    Result := 0
  else
    try
      Result := edI.EditValue
    except
      Result := 0;
    end;
end;

procedure TFrmPanFaixa.Habilitar(aEnabled: Boolean);
begin
  edI.Enabled := aEnabled;
  edF.Enabled := aEnabled;
  lbDe.Enabled := aEnabled;
  lbAte.Enabled := aEnabled;
  btnApagar.Enabled := aEnabled;
end;

function TFrmPanFaixa.MaiorQueZero: Boolean;
begin
  Result := (Inicio>0) or (Fim>0);
end;

procedure TFrmPanFaixa.panPriClick(Sender: TObject);
begin
  edI.SetFocus;
end;

procedure TFrmPanFaixa.SetFim(const Value: variant);
begin
  edF.EditValue := Value;
end;

procedure TFrmPanFaixa.SetInicio(const Value: variant);
begin
  edI.EditValue := Value;
end;

function TFrmPanFaixa.Valido: Boolean;
begin
  Result := (Fim>=Inicio);
end;

function TFrmPanFaixa._MostrarApagar: Boolean;
begin
  Result := FMostrarApagar(Self);
end;

end.
