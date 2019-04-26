unit ncaFrmAss;
{
    NexCafé Admin Form Bunda?

    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxPC, cxControls, cxCheckBox, cxGraphics, cxLookAndFeels,
  cxPCdxBarPopupMenu, dxBarBuiltInMenu;

type
  TFrmAss = class(TForm)
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    btnComprarAss: TcxButton;
    btnFechar: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cbNaoMostrarMsgVenc: TcxCheckBox;
    lbData: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnComprarAssClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAss: TFrmAss;

implementation

uses ncClassesBase, uLicExeCryptor, ncaDM, ncShellStart, nexUrls;

// START resource string wizard section
resourcestring
  SSuaAssinaturaNexCaféPremiumVence = 'Sua assinatura NexCafé Premium venceu.';
  SComprarAssinaturaPremium = 'Comprar Assinatura Premium';

// END resource string wizard section


{$R *.dfm}

procedure TFrmAss.btnComprarAssClick(Sender: TObject);
begin
  ShellStart(gUrls.Url('contas_assinar', 'conta='+RegistroGlobal.Conta)); // do not localize
end;

procedure TFrmAss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if (Paginas.ActivePageIndex=1) and 
     cbNaoMostrarMsgVenc.Visible and 
     (cbNaoMostrarMsgVenc.Checked <> (not gConfig.AlertaAssinatura)) 
  then with Dados do begin
    CM.Config.AtualizaCache;
    CM.Config.AlertaAssinatura := not cbNaoMostrarMsgVenc.Checked;
    CM.SalvaAlteracoesObj(CM.Config, False);
    tbConfig.Refresh;
  end;
end;

procedure TFrmAss.FormCreate(Sender: TObject);
begin
  RegistroGlobal.Conta := gConfig.Conta;
end;

procedure TFrmAss.FormShow(Sender: TObject);
begin
  if (gConfig.AssinaturaVenceEm>0) or gConfig.JaFoiPremium then
  begin
    cbNaoMostrarMsgVenc.Visible := Dados.CM.UA.Admin;
    cbNaoMostrarMsgVenc.Checked := not gConfig.AlertaAssinatura;
    Paginas.ActivePageIndex := 1;
    if gConfig.AssinaturaVenceEm>=Date then
      lbData.Caption := FormatDateTime('dd/mm/yyy', gConfig.AssinaturaVenceEm)  // TODO : check string
    else begin
      lbData.Visible := False;
      cxLabel1.Caption := SSuaAssinaturaNexCaféPremiumVence;
    end;
  end else begin
    Paginas.ActivePAgeIndex := 0;
    btnComprarAss.Caption := SComprarAssinaturaPremium;
  end;
end;

end.

