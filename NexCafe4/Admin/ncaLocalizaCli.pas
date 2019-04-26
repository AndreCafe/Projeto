unit ncaLocalizaCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TFrmLocalizaCli = class(TForm)
    lbCod: TcxLabel;
    edCodigo: TcxTextEdit;
    btnLocalizar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure edCodigoPropertiesChange(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FRes: Integer;
    FCod: String;
    { Private declarations }
  public
    function Localizar: Integer;
    { Public declarations }
  end;

var
  FrmLocalizaCli: TFrmLocalizaCli;

implementation

{$R *.dfm}

procedure TFrmLocalizaCli.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLocalizaCli.btnLocalizarClick(Sender: TObject);
begin
  FRes := StrToIntDef(FCod, 0);
  Close;
end;

procedure TFrmLocalizaCli.edCodigoPropertiesChange(Sender: TObject);
begin
  FCod := edCodigo.EditingText;
  btnLocalizar.Enabled := (FCod>'');

  if Length(FCod)>5 then begin
    FRes := StrToIntDef(FCod, 0);
    Close;
  end;
end;

procedure TFrmLocalizaCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLocalizaCli.FormCreate(Sender: TObject);
begin
  FRes := 0;
  FCod := '';
end;

function TFrmLocalizaCli.Localizar: Integer;
begin
  ShowModal;
  Result := FRes;
end;

end.
