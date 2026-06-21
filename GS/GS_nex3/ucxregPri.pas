unit ucxregPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, pngimage, ExtCtrls,
  LMDCustomComponent, LMDWndProcComponent, LMDTrayIcon;

type
  TFrmPri = class(TForm)
    cxButton1: TcxButton;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lbCodLoja: TLabel;
    lbTipoLic: TLabel;
    lbVenc: TLabel;
    lbMaq: TLabel;
    Image1: TImage;
    btnMinimizar: TcxButton;
    btnFechar: TcxButton;
    Tray: TLMDTrayIcon;
    Image2: TImage;
    Image3: TImage;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TrayClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    Primeiro : Boolean;
    procedure AtualizaLic;
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uFrmRegistro, uLicenca;

{$R *.dfm}

procedure TFrmPri.cxButton1Click(Sender: TObject);
var S: String;
begin
  LicencaGlobal.LeArquivoPadrao;
  LicencaGlobal.LeSerialHD;
  S := LicencaGlobal.AsString;
  S := TFrmRegistro.Create(Self).EditaLicenca(S, False);
  if S <> LicencaGlobal.AsString then begin
    LicencaGlobal.AsString := S;
    LicencaGlobal.SalvaArquivoPadrao;
    AtualizaLic;
  end;  
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  AtualizaLic;
  if Primeiro then begin
    Tray.Active := True;
    PostMessage(Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
    Primeiro := False;
  end;  
end;

procedure TFrmPri.TrayClick(Sender: TObject);
begin
  Application.Restore;
  Show;
end;

procedure TFrmPri.btnFecharClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente fechar o Servidor de Registro Control-X?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
    Tray.NoClose := False;
    Close;
  end;  
end;

procedure TFrmPri.AtualizaLic;
begin
  lbCodLoja.Caption := LicencaGlobal.CodLojaAsString;
  with LicencaGlobal do 
  case liTipo of
    tlTemporaria,
    tlTeste : begin
      if liTipo=tlTemporaria then
        lbTipoLic.Caption := 'Temporária'
      else
        lbTipoLic.Caption := 'Teste Gratuíto';  
      lbTipoLic.Font.Color := clBlack;
      Label4.Caption := 'Máquinas:';
      lbMaq.Caption := IntToStr(LicencaGlobal.liMaquinas);
      lbVenc.Caption    := FormatDateTime('dd/mm/yyyy', LicencaGlobal.liVencimento);
      if LicencaGlobal.Expirou then begin
        Label3.Caption := 'Expirou em:';
        lbVenc.Font.Color := clRed;
        Tray.Icon.Assign(Image2.Picture.Icon);
      end else begin
        Label3.Caption    := 'Expira em:';
        lbVenc.Font.COlor := clYellow;
        Tray.Icon.Assign(Image3.Picture.Icon);
      end;
    end;    
    tlDefinitiva : begin
      lbTipoLic.Font.Color := clBlack;
      lbTipoLic.Caption := 'Definitiva';
      Label3.Caption := 'Expira em:';
      lbVenc.Caption := 'Nunca';
      lbVenc.Font.COlor := clGreen;
      Label4.Caption := 'Máquinas:';
      Tray.Icon.Assign(Image3.Picture.Icon);
      lbMaq.Caption := IntToStr(LicencaGlobal.liMaquinas);
    end; 
  else   
    lbTipoLic.Caption := 'Não Licenciado';
    lbTipoLic.Font.Color := clRed;
    Label3.Caption := '';
    lbVenc.Caption := '';
    lbVenc.Font.COlor := clGreen;
    lbVenc.Caption := '';
    Label4.Caption := '';
    lbMaq.Caption := '';
    Tray.Icon.Assign(Image2.Picture.Icon);
  end;
end;

procedure TFrmPri.btnMinimizarClick(Sender: TObject);
begin
  Tray.Active := True;
  PostMessage(Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  Primeiro := True;
end;

procedure TFrmPri.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

initialization
  LicencaGlobal.LeArquivoPadrao;
  LicencaGlobal.LeSerialHD;

end.
