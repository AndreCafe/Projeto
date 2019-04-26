unit ncaFrmSemEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxLabel, cxCheckBox;

type
  TFrmSemEstoque = class(TForm)
    lbInsuficiente: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    lbQuant: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    btnOk: TcxButton;
    cbPermitir: TcxCheckBox;
    lbDescr: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function PodeVender(aProduto: String; aEst: Double): Boolean;
  end;

var
  FrmSemEstoque: TFrmSemEstoque;

implementation

uses ncIDRecursos, ncaDM;

{$R *.dfm}

procedure TFrmSemEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSemEstoque.FormCreate(Sender: TObject);
begin
  cbPermitir.Enabled := Permitido(daPodeAutorizarVendaEstInsuficiente);
end;

procedure TFrmSemEstoque.FormShow(Sender: TObject);
begin
  MessageBeep(MB_ICONEXCLAMATION);
end;

function TFrmSemEstoque.PodeVender(aProduto: String;
  aEst: Double): Boolean;
begin
  lbDescr.Caption := aProduto;
  lbQuant.Caption := FloatToStr(aEst);
  ShowModal;
  Result := (ModalResult=mrOk) and cbPermitir.Checked;
end;

end.
