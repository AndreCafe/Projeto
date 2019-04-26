unit ncaFrmEditDesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxCurrencyEdit, cxLabel, dxGDIPlusClasses, ExtCtrls;

type
  TFrmEditDesc = class(TForm)
    LMDSimplePanel2: TLMDSimplePanel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    panValor: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    edValor: TcxCurrencyEdit;
    panPerc: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    edPerc: TcxCurrencyEdit;
    panPremium: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPercKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edValorPropertiesChange(Sender: TObject);
    procedure edPercPropertiesEditValueChanged(Sender: TObject);
    procedure edPercPropertiesChange(Sender: TObject);
    procedure edValorPropertiesEditValueChanged(Sender: TObject);
    procedure panPremiumClick(Sender: TObject);
  private
    { Private declarations }
    FPerc: Boolean;
    FTotal : Currency;
    FCalculando : Boolean;

    procedure calcula;

    procedure FocusPerc;
    procedure FocusSalvar;
  public
    function Editar(aTotal: Currency; var aValor: Currency; var aPerc: Double; var aDescPerc: Boolean): Boolean;
    { Public declarations }
  end;

var
  FrmEditDesc: TFrmEditDesc;

implementation

uses ncaFrmPri, ncaDM, ncIDRecursos, ncClassesBase;

{$R *.dfm}

{ TForm1 }

procedure TFrmEditDesc.btnSalvarClick(Sender: TObject);
begin
  edValor.PostEditValue;
end;

procedure TFrmEditDesc.calcula;
begin
  if FCalculando then Exit;

  try
    FCalculando := True;
    if Fperc then begin
      if edPerc.Value>100 then begin
        edValor.Value := 0;
        edPerc.Value := 100;
        if edPerc.Focused then edPerc.SelectAll;
      end else
        edValor.Value := DuasCasas(FTotal * edPerc.Value / 100);
    end else begin
      if edValor.Value>FTotal then begin
        edPerc.Value := 100;
        edValor.Value := FTotal;
        if edValor.Focused then edValor.SelectAll;
      end else
        edPerc.Value := DuasCasas(edValor.Value / FTotal * 100);
    end;
  finally
    FCalculando := False;
  end;
end;

function TFrmEditDesc.Editar(aTotal: Currency; var aValor: Currency; var aPerc: Double; var aDescPerc: Boolean): Boolean;
begin
  edValor.Value := aValor;
  FPerc := aDescPerc and (aPerc>0);
  edPerc.Value := aPerc;
  FTotal := aTotal;
  Calcula;
  ShowModal;
  if ModalResult=mrOk then begin
    aValor := edValor.Value;
    aPerc := edPerc.Value;
    aDescPerc := FPerc;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmEditDesc.edPercKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : FocusSalvar;
    Key_Up : edValor.SetFocus;
  end;
end;

procedure TFrmEditDesc.edPercPropertiesChange(Sender: TObject);
begin
  if edPerc.Focused then edPerc.PostEditValue;
end;

procedure TFrmEditDesc.edPercPropertiesEditValueChanged(Sender: TObject);
begin
  if edPerc.Focused then begin
    FPerc := True;
    Calcula;
  end;
end;

procedure TFrmEditDesc.edValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Down, Key_Enter: FocusPerc;
  end;
end;

procedure TFrmEditDesc.edValorPropertiesChange(Sender: TObject);
begin
  if edValor.Focused then edValor.PostEditValue;
end;

procedure TFrmEditDesc.edValorPropertiesEditValueChanged(Sender: TObject);
begin
  if edValor.Focused then begin
    FPerc := False;
    Calcula;
  end;
end;

procedure TFrmEditDesc.FocusPerc;
begin
  if edPerc.Enabled then
    edPerc.SetFocus
  else
    FocusSalvar;
end;

procedure TFrmEditDesc.FocusSalvar;
begin
  if btnSalvar.Enabled then btnSalvar.SetFocus;
end;

procedure TFrmEditDesc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEditDesc.FormCreate(Sender: TObject);
begin
  FCalculando := False;
  btnSalvar.Enabled := Permitido(daTraDesconto);
  panPremium.Visible := not gConfig.IsPremium;
  edPerc.Enabled := gConfig.IsPremium;
end;

procedure TFrmEditDesc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key  of
    Key_F2, Key_F3    : if btnSalvar.Enabled then btnSalvar.Click;
    Key_Esc   : ModalResult := mrCancel;
  end;
end;

procedure TFrmEditDesc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13, #27]) then Key := #0;
end;

procedure TFrmEditDesc.panPremiumClick(Sender: TObject);
begin
  OpenPremium('desconto');
end;

end.
