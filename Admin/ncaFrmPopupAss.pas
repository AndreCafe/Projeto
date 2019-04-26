unit ncaFrmPopupAss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, dxGDIPlusClasses, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  StdCtrls, cxButtons;

type
  TFrmPopupAss = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbTopo: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lbDias: TcxLabel;
    lbDias2: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    btnOk: TcxButton;
    lbNaoMostrar: TcxLabel;
    btnBoleto: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnBoletoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbNaoMostrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure _Mostrar(aDias: Integer);
  public
    { Public declarations }

    class function Mostrar: Boolean;
  end;

var
  FrmPopupAss: TFrmPopupAss;

implementation

uses ncClassesBase, uLicEXECryptor, ncaDM, ncaFrmPri;

{$R *.dfm}

resourcestring
  rsUltimoDia = 'Último Dia';
  rsUltimoDiaExt = 'Seu plano PREMIUM está ativo. Hoje é o último dia para realizar o pagamento da sua assinatura e evitar que sua assinatura seja desativada';
  rsDias = 'dias';
  rsDia  = 'dia';
  rsDesativarAviso = 'Deseja realmente desativar o aviso de vencimento para esse pagamento?';
  
{ TFrmPopupAss }

procedure TFrmPopupAss.btnBoletoClick(Sender: TObject);
begin
  OpenTrack('renovar', 'TFrmPopupAss');
end;

procedure TFrmPopupAss.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPopupAss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPopupAss.FormCreate(Sender: TObject);
begin
  lbNaoMostrar.Visible := Dados.CM.UA.Admin;
end;

procedure TFrmPopupAss.lbNaoMostrarClick(Sender: TObject);
begin
  if SimNaoH(rsDesativarAviso, Handle) then begin
    gConfig.AtualizaCache;
    gConfig.ProxAvisoAss := Date + 15;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
    Close;
  end;
end;

class function TFrmPopupAss.Mostrar: Boolean;
var Dias: Integer;
begin
  Dias := gConfig.TolDiasRestantes - 2;
  if (Dias>=0) then begin
    Result := True;
    TFrmPopupAss.Create(nil)._Mostrar(Dias);
  end else
    Result := False;
end;

procedure TFrmPopupAss._Mostrar(aDias: Integer);
var s: String;
begin
  if aDias=0 then begin
    lbDias.Caption := rsUltimoDia;
    lbDias2.Caption := rsUltimoDiaExt;
  end else begin
    if aDias>1 then
      s := rsDias else
      s := rsDia;
    S := intToStr(aDias) + ' ' + S;  
    lbDias.Caption := Format(lbDias.Caption, [S]);
    lbDias2.Caption := Format(lbDias2.Caption, [S]);
  end;
  ShowModal;
end;

end.


