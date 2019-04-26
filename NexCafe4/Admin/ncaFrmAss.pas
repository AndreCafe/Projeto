unit ncaFrmAss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxPC, cxControls, cxCheckBox;

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

uses ncClassesBase, uLicExeCryptor, uFrmLojaNex, uDMBol, uRSAss, ncaDM;

{$R *.dfm}

procedure TFrmAss.btnComprarAssClick(Sender: TObject);
var B: TDadosBoleto;
begin
  if TFrmLojaNex.Create(Self).Assinar(B, uDMBol.DadosEmissao) then
  begin
    dmBol.Atualiza(B);
    dmBol.Mostra(True);
  end;
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
      lbData.Caption := FormatDateTime('dd/mm/yyy', gConfig.AssinaturaVenceEm) 
    else begin
      lbData.Visible := False;
      cxLabel1.Caption := 'Sua assinatura NexCafé Premium venceu.';
    end;
  end else begin
    Paginas.ActivePAgeIndex := 0;
    btnComprarAss.Caption := 'Comprar Assinatura Premium';
  end;
end;

end.
