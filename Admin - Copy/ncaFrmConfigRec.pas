unit ncaFrmConfigRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, StdCtrls, cxRadioGroup, jpeg, cxImage,
  cxDropDownEdit, cxMaskEdit, cxSpinEdit, cxTextEdit, cxLabel, cxMemo, PngImage,
  ExtCtrls, cxButtons, LMDControl, LMDCustomControl, LMDCustomPanel, printers,
  LMDCustomBevelPanel, LMDSimplePanel, ImgList, LMDPNGImage, ncaFrmConfigRec_Serial,
  cxGroupBox;

type
  TFrmConfigRec = class(TFrmBaseOpcao)
    Image1: TImage;
    cxImageList1: TcxImageList;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbRecImprimir: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    rbSempre: TcxRadioButton;
    rbTalvez: TcxRadioButton;
    rbNao: TcxRadioButton;
    LMDSimplePanel4: TLMDSimplePanel;
    lbRecMatricial: TcxLabel;
    cbComboBoxPrinters: TcxComboBox;
    btnConfig: TcxButton;
    LMDSimplePanel5: TLMDSimplePanel;
    lbTipoImp: TcxLabel;
    edRecRodape: TcxMemo;
    lbRecRodape: TcxLabel;
    edRecNomeLoja: TcxTextEdit;
    lbRecNomeLoja: TcxLabel;
    imImpFolha: TcxImage;
    imImpBobina: TcxImage;
    rbImpFolha: TcxRadioButton;
    rbImpBobina: TcxRadioButton;
    btnCustomize: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbImpBobinaClick(Sender: TObject);
    procedure rbImpFolhaClick(Sender: TObject);
    procedure rbNaoClick(Sender: TObject);
    procedure rbSempreClick(Sender: TObject);
    procedure rbTalvezClick(Sender: TObject);
    procedure cbComboBoxPrintersPropertiesChange(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnCustomizeClick(Sender: TObject);
  private
    fRecTipoImpressora : string;
    fPrinterIsWin : boolean;
    fSerial : TFrmConfigRec_Serial;
    function GetImprimirRec: Byte;
    procedure SetImprimirRec(const Value: Byte);
    { Private declarations }
    property ImprimirRec: Byte
      read GetImprimirRec write SetImprimirRec;

  protected
    procedure CreateParams(var Params: TCreateParams); override;
      
    
  public
    { Public declarations }
    procedure Atualizar; 
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;

    function NumItens: Integer; override;
    
  end;

var
  FrmConfigRec: TFrmConfigRec;

implementation

uses ncClassesBase, ncaDM, uNexTransResourceStrings_PT, ncaDMComp;

{$R *.dfm}

procedure SetDefaultPrinter(PrinterName: String) ;
var
    j: Integer;
    Device : PChar;
    Driver : Pchar;
    Port : Pchar;
    HdeviceMode: Thandle;
    aPrinter : TPrinter;
begin
    Printer.PrinterIndex := -1;
    getmem(Device, 255) ;
    getmem(Driver, 255) ;
    getmem(Port, 255) ;
    aPrinter := TPrinter.create;
    for j := 0 to Printer.printers.Count-1 do begin
        if Printer.printers[j] = PrinterName then begin
            aprinter.printerindex := j;
            aPrinter.getprinter(device, driver, port, HdeviceMode) ;
            StrCat(Device, ',') ;
            StrCat(Device, Driver ) ;
            StrCat(Device, Port ) ;
            WriteProfileString('windows', 'device', Device) ;
            StrCopy( Device, 'windows' ) ;
            SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@Device)) ;
        end;
    end;
    Freemem(Device, 255) ;
    Freemem(Driver, 255) ;
    Freemem(Port, 255) ;
    aPrinter.Free;
end;

procedure TFrmConfigRec.FormCreate(Sender: TObject);
var
    idx : integer;
begin
  inherited;
  btnCustomize.Enabled := gConfig.IsPremium;
  cbComboBoxPrinters.Properties.OnChange := nil;
  try
      cbComboBoxPrinters.Properties.Items.Assign(Printer.Printers);
      cbComboBoxPrinters.Properties.Items.Add(SncaFrmConfigRec_OutraSerial);
      cbComboBoxPrinters.ItemIndex := 0;
      idx := cbComboBoxPrinters.Properties.Items.IndexOf(gConfig.RecTipoImpressora);
      if idx>-1 then
          cbComboBoxPrinters.ItemIndex := idx;
  finally
      cbComboBoxPrinters.Properties.OnChange := cbComboBoxPrintersPropertiesChange;
  end;

  atualizar;
end;

procedure TFrmConfigRec.cbComboBoxPrintersPropertiesChange(Sender: TObject);
begin
  inherited;
  fRecTipoImpressora :=  cbComboBoxPrinters.Text;
  fPrinterIsWin := cbComboBoxPrinters.ItemIndex < cbComboBoxPrinters.Properties.Items.count-1;
  if cbComboBoxPrinters.Properties.Items.count>0 then
      Atualizar;
  if cbComboBoxPrinters.Focused and (not fPrinterIsWin) then
    btnConfigClick(nil);
end;

procedure TFrmConfigRec.CreateParams(var Params: TCreateParams);
begin
  inherited;
  fSerial := TFrmConfigRec_Serial.Create(Self);
end;

{ TFrmBaseOpcao1 }

function TFrmConfigRec.Alterou: Boolean;
begin
  Result := True;

  with fSerial do begin
    if ImprimirRec <> gConfig.RecImprimir then Exit;
    if rbImpBobina.Checked <> gConfig.RecMatricial then Exit;
    if cbRecPorta.Text <> gConfig.RecPorta then Exit;
  
    if (gConfig.RecCortaFolha) and (cbCortaFolha.ItemIndex <> 0) then exit;
    if (not gConfig.RecCortaFolha) and (cbCortaFolha.ItemIndex <> 1) then exit;
  
    if cbComboBoxPrinters.Text <> gConfig.RecTipoImpressora then Exit;
    if edRecLargura.Value <> gConfig.RecLargura then Exit;
    if edRecSalto.Value <> gConfig.RecSalto then Exit;
    if edRecNomeLoja.Text <> gConfig.RecNomeLoja then Exit;
    if edRecRodape.Lines.Text <> gConfig.RecRodape then Exit;
  end;

  Result := False;
end;

procedure TFrmConfigRec.Atualizar;
begin
  btnOk.Enabled := Alterou and Dados.CM.UA.Admin;

  cbComboBoxPrinters.Enabled   := (ImprimirRec>0);
  rbImpFolha.Enabled           := (ImprimirRec>0) and (fprinterIsWin);
  btnConfig.Visible            := (ImprimirRec>0) and (not fprinterIsWin);

  rbImpFolha.OnClick  := nil;
  rbImpBobina.OnClick := nil;
  try
{      if not fPrinterIsWin then
        rbImpBobina.Checked  := True;}
      
      edRecNomeLoja.Enabled   := rbImpBobina.Enabled;
      edRecRodape.Enabled     := rbImpBobina.Enabled;

      if (not fPrinterIsWin) then begin
        imImpBobina.Style.BorderStyle := ebsSingle;
        imImpBobina.Style.BorderColor := clGray;
        imImpFolha.Style.BorderStyle := ebsSingle;
        imImpFolha.Style.BorderColor := clGray;
      end else
      if rbImpFolha.Checked then begin
        imImpFolha.Style.BorderStyle := ebsThick;
        imImpFolha.Style.BorderColor := clBlue;
        imImpBobina.Style.BorderStyle := ebsSingle;
        imImpBobina.Style.BorderColor := clGray;
      end else begin
        imImpFolha.Style.BorderStyle := ebsSingle;
        imImpFolha.Style.BorderColor := clGray;
        imImpBobina.Style.BorderStyle := ebsThick;
        imImpBobina.Style.BorderColor := clBlue;
      end;

      if rbImpFolha.Checked then begin
        rbImpFolha.Font.Style := [fsBold];
        rbImpFolha.Font.Color := clBlue;
        rbImpBobina.Font.Style := [];
        rbImpBobina.Font.Color := clBlack;
      end else begin
        rbImpFolha.Font.Style := [];
        rbImpFolha.Font.Color := clBlack;
        rbImpBobina.Font.Style := [fsBold];
        rbImpBobina.Font.Color := clBlue;
      end;

  finally
      rbImpFolha.OnClick  := rbImpFolhaClick;
      rbImpBobina.OnClick := rbImpBobinaClick;
  end;

end;

procedure TFrmConfigRec.btnConfigClick(Sender: TObject);
begin
  inherited;
  fSerial.ShowModal;
end;

procedure TFrmConfigRec.btnCustomizeClick(Sender: TObject);
begin
  inherited;
  dmComp.Customize(fPrinterIsWin, rbImpBobina.Checked);
end;

procedure TFrmConfigRec.FormShow(Sender: TObject);
begin
  inherited;
  Renumera;
end;

function TFrmConfigRec.GetImprimirRec: Byte;
begin
  if rbNao.Checked  then
    Result := 0
  else
  if rbTalvez.Checked then
    Result := 1
  else
    Result := 2;
end;

procedure TFrmConfigRec.Ler;
var
    idx :integer;
begin
  inherited;
  ImprimirRec := gConfig.RecImprimir;
  with fSerial do begin
    if gConfig.RecMatricial then
      rbImpBobina.Checked := True else
      rbImpFolha.Checked := True;
      
    if cbRecPorta.properties.Items.IndexOf(gConfig.RecPorta)=-1 then
      cbRecPorta.itemindex:=0 else
      cbRecPorta.Text := gConfig.RecPorta;
      
    if gConfig.RecCortaFolha then
      cbCortaFolha.ItemIndex := 0 else
      cbCortaFolha.ItemIndex := 1;
      
    cbComboBoxPrinters.Text := gConfig.RecTipoImpressora;
    fRecTipoImpressora := gConfig.RecTipoImpressora;
  
    cbComboBoxPrinters.Properties.OnChange := nil;
    try
        cbComboBoxPrinters.Properties.Items.clear;
        cbComboBoxPrinters.Properties.Items.Assign(Printer.Printers);
        cbComboBoxPrinters.Properties.Items.Add(SncaFrmConfigRec_OutraSerial);
        cbComboBoxPrinters.ItemIndex := 0;
        idx := cbComboBoxPrinters.Properties.Items.IndexOf(gConfig.RecTipoImpressora);
        if idx>-1 then
            cbComboBoxPrinters.ItemIndex := idx;
        fPrinterIsWin := cbComboBoxPrinters.ItemIndex < cbComboBoxPrinters.Properties.Items.count-1;
    finally
        cbComboBoxPrinters.Properties.OnChange := cbComboBoxPrintersPropertiesChange;
    end;

    edRecLargura.Value := gConfig.RecLargura;
    edRecSalto.Value := gConfig.RecSalto;
    edRecNomeLoja.Text := gConfig.RecNomeLoja;
    edRecRodape.Lines.Text := gConfig.RecRodape;
  end;

  Atualizar;
end;

function TFrmConfigRec.NumItens: Integer;
begin
  Result := 4;
end;

procedure TFrmConfigRec.rbImpBobinaClick(Sender: TObject);
begin
  inherited;
  rbImpBobina.Checked := True;
  Atualizar;
end;

procedure TFrmConfigRec.rbImpFolhaClick(Sender: TObject);
begin
  inherited;
  rbImpFolha.Checked := True;
  Atualizar;
end;

procedure TFrmConfigRec.rbNaoClick(Sender: TObject);
begin
  inherited;
  ImprimirRec := 0;
  Atualizar;
end;

procedure TFrmConfigRec.rbSempreClick(Sender: TObject);
begin
  inherited;
  ImprimirRec := 2;
  Atualizar;
end;

procedure TFrmConfigRec.rbTalvezClick(Sender: TObject);
begin
  inherited;
  ImprimirRec := 1;
  Atualizar;
end;

procedure TFrmConfigRec.Renumera;
begin
  inherited;
  lbRecImprimir.Caption := IntToStr(InicioNumItem)+'. '+lbRecImprimir.Caption;
  lbRecMatricial.Caption := IntToStr(InicioNumItem+1)+'. '+lbRecMatricial.Caption;
  lbRecNomeLoja.Caption := IntToStr(InicioNumItem+2)+'. '+lbRecNomeLoja.Caption;
  lbRecRodape.Caption := IntToStr(InicioNumItem+3)+'. '+lbRecRodape.Caption;
end;

procedure TFrmConfigRec.Salvar;
begin
  inherited;
  with fSerial do begin
    gConfig.AtualizaCache;
    gConfig.RecImprimir := ImprimirRec;
    gConfig.RecMatricial := rbImpBobina.Checked;

    gConfig.RecTipoImpressora := fRecTipoImpressora;
    gConfig.RecPorta := cbRecPorta.Text;
    gConfig.RecCortaFolha := cbCortaFolha.ItemIndex = 0;
    gConfig.RecLargura := edRecLargura.Value;
    gConfig.RecSalto := edRecSalto.Value;
    gConfig.RecNomeLoja := edRecNomeLoja.Text;
    gConfig.RecRodape := edRecRodape.Lines.Text;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);

    SetDefaultPrinter(cbComboBoxPrinters.Text);
  end;
end;

procedure TFrmConfigRec.SetImprimirRec(const Value: Byte);
begin
  case Value of
    0 : begin
      rbNao.Checked := True;
      rbNao.Font.Style := [fsBold];
      rbNao.Font.Color := clBlue;
      rbTalvez.Font.Style := [];
      rbSempre.Font.Style := [];
      rbTalvez.Font.Color := clBlack;
      rbSempre.Font.Color := clBlack;
    end;  
    1 : begin
      rbTalvez.Checked := True;
      rbTalvez.Font.Style := [fsBold];
      rbTalvez.Font.Color := clBlue;
      rbNao.Font.Style := [];
      rbSempre.Font.Style := [];
    end;  
    2 : begin
      rbSempre.Checked := True;
      rbSempre.Font.Style := [fsBold];
      rbSempre.Font.Color := clBlue;
      rbTalvez.Font.Style := [];
      rbNao.Font.Style := [];
      rbTalvez.Font.Color := clBlack;
      rbNao.Font.Color := clBlack;
    end;  
  end;
end;

end.
