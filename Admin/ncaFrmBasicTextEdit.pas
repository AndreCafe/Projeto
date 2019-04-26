unit ncaFrmBasicTextEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, cxLabel;

type
  TFrmBasicTextEdit = class(TForm)
    lbPrompt: TcxLabel;
    Edit: TcxTextEdit;
    LMDSimplePanel1: TLMDSimplePanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    function Editar(aTitulo, aPrompt: String; aMax: Integer; var aTexto: String): Boolean;
  end;

var
  FrmBasicTextEdit: TFrmBasicTextEdit;

implementation

uses ncaFrmPri;

{$R *.dfm}

function TFrmBasicTextEdit.Editar(aTitulo, aPrompt: String; aMax: Integer;
  var aTexto: String): Boolean;
begin
  Caption := aTitulo;
  lbPrompt.Caption := aPrompt;
  Edit.Properties.MaxLength := aMax;
  Edit.Text := aTexto;
  ShowModal;
  if (ModalResult=mrOk) and (Edit.Text<>aTexto) and (Trim(Edit.Text)>'') then begin
    aTexto := Edit.Text;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmBasicTextEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
