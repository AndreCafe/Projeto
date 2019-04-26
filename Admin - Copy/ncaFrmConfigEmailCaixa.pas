unit ncaFrmConfigEmailCaixa;
{
    ResourceString: Dario 11/03/13
}

interface

{$I Nex.inc}


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxtCheckBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit,
  cxCheckListBox, cxMemo, StdCtrls, cxButtons, cxLabel, cxCheckBox, LMDPNGImage,
  ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmConfigEmailCaixa = class(TFrmBaseOpcaoImgTxtCheckBox)
    LMDSimplePanel2: TLMDSimplePanel;
    edEmailDestino: TcxMemo;
    lbEmailDestino: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbEmailConteudo: TcxLabel;
    edEmailConteudo: TcxCheckListBox;
    LMDSimplePanel4: TLMDSimplePanel;
    lbEmailIdent: TcxLabel;
    edEmailIdent: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure CBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;
    procedure Atualizar;

    procedure Renumera; override;
    function NumItens: Integer; override;
  
    { Public declarations }
  end;

var
  FrmConfigEmailCaixa: TFrmConfigEmailCaixa;

implementation

uses ncClassesBase;

// START resource string wizard section
resourcestring
  SVocêEsqueceuDeInformarUmEMailPar = 'Você esqueceu de informar um e-mail para onde deve ser enviado o relatório de caixa :-)';

// END resource string wizard section


{$R *.dfm}

{ TFrmBaseOpcaoImgTxtCheckBox1 }

function TFrmConfigEmailCaixa.Alterou: Boolean;
begin
  Result := True;
  if CB.Checked <> gConfig.EmailEnviarCaixa then Exit;
  if edEmailDestino.Text <> gConfig.EmailDestino then Exit;
  if edEmailConteudo.EditValue <> gConfig.EmailConteudo then Exit;
  if edEmailIdent.Text <> gConfig.EmailIdent then Exit;
  Result := False;
end;

procedure TFrmConfigEmailCaixa.Atualizar;
begin
  lbEmailDestino.Enabled := CB.Checked;
  edEmailDestino.Enabled := lbEmailDestino.Enabled;
  lbEmailConteudo.Enabled := lbEmailDestino.Enabled;
  edEmailConteudo.Enabled := lbEmailConteudo.Enabled;
  lbEmailIdent.Enabled := edEmailConteudo.Enabled;
  edEmailIdent.Enabled := lbEmailIdent.Enabled;
end;

procedure TFrmConfigEmailCaixa.CBClick(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TFrmConfigEmailCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  {$ifdef Loja}
   edEmailConteudo.Items[3].Free;
  {$endif}
end;

procedure TFrmConfigEmailCaixa.FormShow(Sender: TObject);
begin
  inherited;
  Renumera;
end;

procedure TFrmConfigEmailCaixa.Ler;
begin
  inherited;
  CB.Checked := gConfig.EmailEnviarCaixa;
  edEmailDestino.Text := gConfig.EmailDestino;
  edEmailConteudo.EditValue := gConfig.EmailConteudo;
  edEmailIdent.Text := gConfig.EmailIdent;
end;

function TFrmConfigEmailCaixa.NumItens: Integer;
begin
  Result := 4;
end;

procedure TFrmConfigEmailCaixa.Renumera;
begin
  CB.Caption := IntToStr(InicioNumItem)+'. '+CB.Caption;
  lbEmailDestino.Caption := IntToStr(InicioNumItem+1)+'. '+lbEmailDestino.Caption;
  lbEmailConteudo.Caption := IntToStr(InicioNumItem+2)+'. '+lbEmailConteudo.Caption;
  lbEmailIdent.Caption := IntToStr(InicioNumItem+3)+'. '+lbEmailIdent.Caption;
end;

procedure TFrmConfigEmailCaixa.Salvar;
begin
  inherited;
  if CB.Checked and (Trim(edEmailDestino.Text)='') then 
    Raise Exception.Create(SVocêEsqueceuDeInformarUmEMailPar);
  
  gConfig.EmailEnviarCaixa := CB.Checked;
  gConfig.EmailDestino := edEmailDestino.Text;
  gConfig.EmailConteudo := edEmailConteudo.EditValue;
  gConfig.EmailIdent := edEmailIdent.Text;
end;

end.

