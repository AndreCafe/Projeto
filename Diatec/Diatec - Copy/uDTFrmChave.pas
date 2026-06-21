unit uDTFrmChave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OvcEditF, OvcEdPop, OvcEdCal, OvcBase, OvcEF, OvcPB,
  OvcNF, OvcSC, OvcPF, 
  LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  licClasses,
  LMDCustomControl, 
  LMDCustomPanel, 
  LMDCustomBevelPanel, 
  LMDSimplePanel;

type

  TFrmChave = class(TForm)
    btnLiberar: TBitBtn;
    btnContinuar: TBitBtn;
    OvcController1: TOvcController;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDLabel9: TLMDLabel;
    LMDLabel11: TLMDLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    lbTipo: TLMDLabel;
    lbExpira: TLMDLabel;
    LMDLabel14: TLMDLabel;
    LMDLabel15: TLMDLabel;
    LMDSimplePanel7: TLMDSimplePanel;
    LMDLabel16: TLMDLabel;
    edLicenca: TOvcPictureField;
    LMDSimplePanel8: TLMDSimplePanel;
    LMDLabel17: TLMDLabel;
    edSerie: TOvcPictureField;
    LMDLabel2: TLMDLabel;
    procedure btnLiberarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LMDLabel16Click(Sender: TObject);
    procedure LMDLabel17Click(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FLicenca : TLicenca;
    FResultado : String;
    function Liberar(aLicenca: String): String;
    procedure DadosLic;
    { Public declarations }
  end;

  TLicencaStr     = String[40];

var
  FrmChave: TFrmChave;

implementation

{$R *.DFM}

procedure TFrmChave.btnLiberarClick(Sender: TObject);
begin
  FLicenca.AsString := edLicenca.AsString;
  FLicenca.LeSerialHD;
  DadosLic;
  if FLicenca.SenhaOk then begin
    ShowMessage('Número de Licença aplicado com sucesso!');
    FResultado := FLicenca.AsString;
  end else begin
    Beep;
    ShowMessage('A Licença informada não está correta');
  end;
end;

function TFrmChave.Liberar(aLicenca: String): String;
begin
  FResultado := aLicenca;
  FLicenca.AsString := aLicenca;
  FLicenca.LeSerialHD;
  edSerie.Text := IntToHex(FLicenca.liNumSerie, 8);
  edLicenca.AsString := LimpaTraco(aLicenca);
  DadosLic;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmChave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmChave.DadosLic;
begin
  if FLicenca.SenhaOk then begin 
    if FLicenca.liDefinitiva then begin
      lbTipo.Caption := ' Definitiva';
      lbExpira.Caption := ' Nunca';
      lbTipo.Color := clGreen;
      lbTipo.Font.Color := clWhite;
    end else begin
      lbTipo.Caption := ' Temporária';
      lbExpira.Caption := ' '+FormatDateTime('dd/mm/yyyy', FLicenca.liVencimento);;
      lbTipo.Color := clYellow;
      lbTipo.Font.Color := clBlack;
      
    end;
  end else begin
    lbTipo.Caption := ' Não Licenciado';
    lbExpira.Caption := '';
    lbTipo.Color := clRed;
    lbTipo.Font.Color := clWhite;
  end;
end;

procedure TFrmChave.LMDLabel16Click(Sender: TObject);
begin
  edLicenca.SetFocus;
  edLicenca.SelectAll;
end;

procedure TFrmChave.LMDLabel17Click(Sender: TObject);
begin
  edSerie.SetFocus;
  edSerie.SelectAll;
end;

procedure TFrmChave.btnContinuarClick(Sender: TObject);
begin
  Close;
end;

end.
