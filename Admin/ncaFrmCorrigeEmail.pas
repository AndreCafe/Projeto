unit ncaFrmCorrigeEmail;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxClasses, cxLabel,
  cxTextEdit, LMDPNGImage, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFrmCorrigeEmail = class(TForm)
    Image1: TImage;
    edEmail: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxEditStyleController1: TcxEditStyleController;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    H: TIdHTTP;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    FEmail : String;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    function EditarEmail(aEmail: String): String;
  end;

var
  FrmCorrigeEmail: TFrmCorrigeEmail;

implementation

uses uNR_chaveseg, nexUrls;

// START resource string wizard section
resourcestring
  SPorFavorInformeCorretamenteSeuEM = 'Por favor, informe corretamente seu e-mail';
  SSeuEMailFoiCorrigidoComSucesso = 'Seu e-mail foi corrigido com sucesso!';

// END resource string wizard section


{$R *.dfm}

procedure TFrmCorrigeEmail.btnOkClick(Sender: TObject);
var 
  P : Integer;
  S : String;
  ChaveSeg : String;
  SL : TStringList;
begin
  P := Pos('@', edEmail.Text);
  if (P<1) then 
    S := '' else 
    S := Copy(edEmail.Text, P+1, 300);

  if Trim(Copy(S, Pos('.', S)+1, 300))='' then begin
    Beep;
    edEmail.SetFocus;
    ShowMessage(SPorFavorInformeCorretamenteSeuEM);
    Exit;
  end;

  if (Trim(FEmail)<>Trim(edEmail.Text)) then begin
    SL := TStringList.Create;
    try
      ChaveSeg := H.Get(gUrls.Url('contas_obtemchaveseg')); // do not localize
      sl.Text := H.Get(gUrls.Url('contas_corrigiremail', 'email='+Trim(FEmail)+'&novoemail='+edEmail.Text+'&chaveseg='+ChaveSeg+'&senhaseg='+GeraSenhaSeg(ChaveSeg))); // do not localize
      if sl.Values['erro']='0' then // do not localize
        ShowMessage(SSeuEMailFoiCorrigidoComSucesso)
      else begin
        Beep;
        ShowMessage(sl.values['erro']); // do not localize
        Exit;
      end;
    finally
      Sl.Free;
    end;
  end;
  
  ModalResult := mrOk;
end;

procedure TFrmCorrigeEmail.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Owner is TWinControl then begin
    params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
    params.WndParent := TCustomForm(Owner).Handle;
  end;
end;

function TFrmCorrigeEmail.EditarEmail(aEmail: String): String;
begin
  edEmail.Text := aEmail;
  FEmail := aEmail;

  ShowModal;

  if (ModalResult=mrOk) and (Trim(FEmail)<>Trim(edEmail.Text)) then
    Result := edEmail.Text else
    Result := '';
end;

procedure TFrmCorrigeEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

