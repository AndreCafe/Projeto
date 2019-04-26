unit ncsFrmCriarContaServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncFrmCriarConta, cxPCdxBarPopupMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus,
  LMDCustomComponent, LMDSysInfo, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ImgList, cxClasses, StdCtrls, cxButtons, cxDropDownEdit,
  cxCheckBox, cxMaskEdit, cxTextEdit, cxLabel, LMDPNGImage, ExtCtrls,
  cxRadioGroup, cxPC, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmCriarContaServ = class(TFrmCriarConta)
  private
    { Private declarations }
  protected
    procedure SalvaLic(aConta, aChaves: String); override;  
  public
    { Public declarations }
  end;

var
  FrmCriarContaServ: TFrmCriarContaServ;

implementation

uses uLicEXECryptor, ncsFrmPri;

{$R *.dfm}

{ TFrmCriarConta1 }

procedure TFrmCriarContaServ.SalvaLic(aConta, aChaves: String);
begin
  inherited;
  RegistroGlobal.Conta := aConta;
  RegistroGlobal.StringChaves := aChaves;
  RegistroGlobal.SalvaArqPadrao;
  PostMessage(FrmPri.Handle, wm_user + 1, 0, 0);
end;

end.
