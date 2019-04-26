unit ncaFrmPanTopo;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

{$I NEX.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxLabel, LMDPNGImage,
  ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, IBDatabase;

type
  TFrmPanTopo = class(TForm)
    panNaoAtivou: TLMDSimplePanel;
    Image2: TImage;
    cxLabel1: TcxLabel;
    cxButton4: TcxButton;
    PopupMenu1: TPopupMenu;
    Utilizaroutroregistro1: TMenuItem;
    Criarumnovoregistro1: TMenuItem;
    cxButton5: TcxButton;
    panOutroHD: TLMDSimplePanel;
    Image5: TImage;
    lbOutro: TcxLabel;
    btnTransferir: TcxButton;
    cxButton7: TcxButton;
    LMDSimplePanel6: TLMDSimplePanel;
    panBloqueado: TLMDSimplePanel;
    lbBloq: TcxLabel;
    cxButton6: TcxButton;
    Image6: TImage;
    panSemRegistro: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    Image4: TImage;
    btnJaTenhoConta: TcxButton;
    btnCriarConta: TcxButton;
    Image1: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    Image3: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    Image7: TImage;
    LMDSimplePanel3: TLMDSimplePanel;
    Image8: TImage;
    procedure btnCriarContaClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnJaTenhoContaClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
  private
    { Private declarations }
    FAtual : TLMDSimplePanel;
  public
    { Public declarations }
    procedure Mostrar(aPan: TLMDSimplePanel);
    procedure Verifica;

    function PodeIniciar: Boolean;
  end;

var
  FrmPanTopo: TFrmPanTopo;

implementation

uses ncaFrmPri, ncaFrmCriarConta2, ncClassesBase, uLicEXECryptor;

// START resource string wizard section
resourcestring
  SSeuNEXEstáRegistradoParaOutroCom = 'Seu NEX! está registrado para outro computador';
  SSeuRegistroDoNEXFoiBloqueadoFaça = 'Seu registro do NEX! foi bloqueado. Faça contato com a Nextar.';
  SSuaContaNexCaféEstáBloqueadoFaça = 'Sua conta NexCafé está bloqueado. Faça contato com a Nextar';

// END resource string wizard section


{$R *.dfm}

{ TFrmPanTopo }

procedure TFrmPanTopo.btnCriarContaClick(Sender: TObject);
begin
  TFrmCriarConta2.Create(FrmPri).Mostrar(1);
end;

procedure TFrmPanTopo.btnJaTenhoContaClick(Sender: TObject);
begin
  TFrmCriarConta2.Create(FrmPri).Mostrar(4);
end;

procedure TFrmPanTopo.btnTransferirClick(Sender: TObject);
begin
  TFrmCriarConta2.Create(FrmPri).Mostrar(5);
end;

procedure TFrmPanTopo.cxButton4Click(Sender: TObject);
begin
  TFrmCriarConta2.Create(FrmPri).Mostrar(3);
end;

procedure TFrmPanTopo.FormCreate(Sender: TObject);
begin
  FAtual := nil;
  {$ifdef Loja}
  lbOutro.Caption := SSeuNEXEstáRegistradoParaOutroCom;
  lbBloq.Caption := SSeuRegistroDoNEXFoiBloqueadoFaça;
  {$endif}
end;

procedure TFrmPanTopo.Mostrar(aPan: TLMDSimplePanel);
begin
  if aPan=FAtual then Exit;
  if FAtual<>nil then FAtual.Parent := Self;
  FAtual := aPan;
  if FAtual<>nil then FAtual.Parent := FrmPri;
end;

function TFrmPanTopo.PodeIniciar: Boolean;
begin
  result := False;
  case gConfig.StatusConta of 
    scSemConta : TFrmCriarConta2.Create(FrmPri).Mostrar(0);
//    scAtivar   : TFrmCriarConta2.Create(FrmPri).Mostrar(3);
    scOutroHD  : TFrmCriarConta2.Create(FrmPri).Mostrar(5);
    scBloqueada : ShowMessage(SSuaContaNexCaféEstáBloqueadoFaça);
  else
    result := True;
  end;
end;

procedure TFrmPanTopo.Verifica;
begin
  case gConfig.StatusConta of
    scSemConta : Mostrar(panSemRegistro);
    scAtivar   : Mostrar(panNaoAtivou);
    scOutroHD  : Mostrar(panOutroHD);
    scBloqueada : Mostrar(panBloqueado);
  else
    Mostrar(nil);
  end;
end;

end.

