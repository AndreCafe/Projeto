unit ncaFrmImpEtqCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frxClass, DB, nxdb,
  ncClassesBase, cxRadioGroup, frxDesgn, frxDCtrl, frxCross, frxChBox,
  frxBarcode, frxRich, frxDBSet, cxGraphics, Menus, frxExportRTF, frxExportMail,
  frxExportPDF, ncPassaportes, cxLabel;

type
  TFrmImpEtqCli = class(TForm)
    Label2: TLabel;
    edInicio: TcxSpinEdit;
    btnImprimir: TcxButton;
    btnFechar: TcxButton;
    btnEditar: TcxButton;
    rbAtual: TcxRadioButton;
    rbTodos: TcxRadioButton;
    lbCli: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FRes : Integer;
    { Public declarations }
    function Editar(aNome: String; var AInicio: Integer; var ATodos: Boolean): Integer;
  end;

var
  FrmImpEtqCli: TFrmImpEtqCli;

implementation

{$R *.dfm}

procedure TFrmImpEtqCli.btnImprimirClick(Sender: TObject);
begin
  FRes := 1;
  Close;
end;

function TFrmImpEtqCli.Editar(aNome: String; var AInicio: Integer;
  var ATodos: Boolean): Integer;
begin
  FRes := 0;
  edInicio.Value := AInicio;
  rbAtual.Checked := not ATodos;
  rbTodos.Checked := ATodos;
  lbCli.Caption := aNome;
  ShowModal;
  Result := FRes;
  ATodos := rbTodos.Checked;
  AInicio := edInicio.Value;
end;

procedure TFrmImpEtqCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImpEtqCli.btnEditarClick(Sender: TObject);
begin
  FRes := 2;
  Close;
end;

procedure TFrmImpEtqCli.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
