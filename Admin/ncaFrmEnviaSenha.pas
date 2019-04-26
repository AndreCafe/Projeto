unit ncaFrmEnviaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPCdxBarPopupMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  LMDPNGImage, ExtCtrls, ieview, iemview, cxLabel, LMDCustomComponent,
  LMDBaseController, LMDCustomContainer, LMDGenericList;

type
  TThSendEmail = class (TThread)
  private
    FUsers : TStrings;
    FContaLoja : String;
    FEnviou : Boolean;
  protected
    procedure Execute; override;

    constructor Create(aConta, aUsers: String); 

    destructor Destroy; override;
  end;
  
  TFrmEnviaSenha = class(TForm)
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxLabel1: TcxLabel;
    img: TImageEnMView;
    Image1: TImage;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Image2: TImage;
    lbEmail: TcxLabel;
    cxButton2: TcxButton;
    genList: TLMDGenericList;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    FUsers: String;
  public
    procedure OnTerminateSendEmail(Sender: TObject);
    procedure Mostrar(aContaLoja, aUsers: String);
    { Public declarations }
  end;

var
  FrmEnviaSenha: TFrmEnviaSenha;

implementation

uses ncKiteApi;

{$R *.dfm}

{ TFrmEnviaSenha }

procedure TFrmEnviaSenha.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEnviaSenha.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEnviaSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := caFree;
end;

procedure TFrmEnviaSenha.FormCreate(Sender: TObject);
begin
  img.mio.LoadFromStreamGIF(genList.Items[0].Data);
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmEnviaSenha.FormShow(Sender: TObject);
begin
  img.Playing := True;
  img.PlayLoop := True;
end;

procedure TFrmEnviaSenha.Mostrar(aContaLoja, aUsers: String);
begin
  lbEmail.Caption := aContaLoja;
  FUsers := aUsers;
  ShowModal;
end;

procedure TFrmEnviaSenha.OnTerminateSendEmail(Sender: TObject);
begin
  with TThSendEmail(Sender) do begin
    if FEnviou then
      Paginas.ActivePageIndex := 2 else
      Paginas.ActivePageIndex := 1;
  end;
end;

procedure TFrmEnviaSenha.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  with TThSendEmail.Create(lbEmail.Caption, FUsers) do begin
    OnTerminate := OnTerminateSendEmail;
    Resume;
  end;
end;

{ TThSendEmail }

constructor TThSendEmail.Create(aConta, aUsers: String);
begin
  inherited Create(True);
  FContaLoja := aConta;
  FUsers := TStringList.Create;
  FUsers.Text := aUsers;
  FEnviou := False;
  FreeOnTerminate := True;
end;

destructor TThSendEmail.Destroy;
begin
  FUsers.Free;
  inherited;
end;

procedure TThSendEmail.Execute;
begin
  inherited;
  try
    FEnviou := kapi_esqueceu_senha(FContaLoja, FUsers);
  except
  end;
end;

end.


