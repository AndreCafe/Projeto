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
var
  IsNCLIC2: Boolean;
  sLicPath: String;
  slLic: TStringList;
begin
  inherited;
  RegistroGlobal.Conta := aConta;
  IsNCLIC2 := Copy(aChaves, 1, 6) = 'NCLIC2'; // do not localize
  if not IsNCLIC2 then
    RegistroGlobal.StringChaves := aChaves;
  RegistroGlobal.SalvaArqPadrao;
  // Gravar chave NCLIC2 diretamente no arquivo (SetStringChaves rejeita chaves != 24 chars)
  if IsNCLIC2 then begin
    try
      sLicPath := ExtractFilePath(ParamStr(0)) + 'LicArq.txt'; // do not localize
      if not FileExists(sLicPath) then
        sLicPath := ExtractFilePath(ParamStr(0)) + 'Lic.txt'; // do not localize
      slLic := TStringList.Create;
      try
        if FileExists(sLicPath) then
          slLic.LoadFromFile(sLicPath);
        slLic.Values['Chaves'] := aChaves; // do not localize
        slLic.SaveToFile(sLicPath);
      finally
        slLic.Free;
      end;
    except
    end;
  end;
  PostMessage(FrmPri.Handle, wm_user + 1, 0, 0);
end;

end.
