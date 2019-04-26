unit ncaFrmFundo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, ActnList, Buttons, PngSpeedButton, LMDControl;

type
  TFrmFundo = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Imagem: TImage;
    btnEnviar: TPngSpeedButton;
    btnSelImagem: TPngSpeedButton;
    btnFechar: TPngSpeedButton;
    ActionList1: TActionList;
    LMDSimplePanel2: TLMDSimplePanel;
    OpenDlg: TOpenDialog;
    btnSemFundo: TPngSpeedButton;
    procedure btnSemFundoClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelImagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDesktop: Boolean;
    FUArq: String;
    { Private declarations }
  public
    procedure Mostrar(aDesktop: Boolean);
    { Public declarations }
  end;

var
  FrmFundo: TFrmFundo;

implementation

uses 
  ncaDM, 
  ncaFrmPri;

{$R *.dfm}

procedure TFrmFundo.btnEnviarClick(Sender: TObject);
begin
  Dados.CM.EnviaArqFundo(FUArq, FDesktop);
  btnSemFundo.Enabled := True;
  btnEnviar.Enabled := False;
end;

procedure TFrmFundo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFundo.btnSelImagemClick(Sender: TObject);
begin
  if OpenDlg.Execute then begin
    Imagem.Picture.LoadFromFile(OpenDlg.FileName);
    FUArq := OpenDlg.FileName;
    btnEnviar.Enabled := True;
    btnSemFundo.Enabled := True;
  end;
end;

procedure TFrmFundo.btnSemFundoClick(Sender: TObject);
begin
  if SimNaoH('Deseja realmente apagar a imagem de fundo das máquinas clientes?', Handle) then begin
    Dados.CM.LimpaFundo(FDesktop);
    Imagem.Picture.Bitmap.FreeImage;
    btnSemFundo.Enabled := False;
    btnEnviar.Enabled := False;
  end;
end;

procedure TFrmFundo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    if btnEnviar.Enabled and SimNaoH('Você não enviou a imagem para as máquinas clientes. Deseja enviar agora?', Handle) then
      btnEnviarClick(nil);
      
    Action := caFree;
  except
    Action := caNone;
  end;
end;

procedure TFrmFundo.FormCreate(Sender: TObject);
begin
  FUArq := '';
end;

procedure TFrmFundo.Mostrar(aDesktop: Boolean);
begin
  FDesktop := aDesktop;
  with Dados do 
  if aDesktop then begin
    OpenDlg.Filter := 'Arquivos JPEG|*.jpg';
    if CM.NomeArqDesktop>'' then begin
      if FileExists(CM.NomeArqDesktop) then begin
        Imagem.Picture.LoadFromFile(CM.NomeArqDesktop);
        btnSemFundo.Enabled := True;
      end;
    end;
  end else begin
    OpenDlg.Filter := 'Arquivos JPEG|*.jpg|Arquivos GIF|*.gif';
    if CM.NomeArqLogin>'' then begin
      if FileExists(CM.NomeArqLogin) then begin
        Imagem.Picture.LoadFromFile(CM.NomeArqLogin);
        btnSemFundo.Enabled := True;
      end;
    end;
  end;
  ShowModal;
end;

end.
