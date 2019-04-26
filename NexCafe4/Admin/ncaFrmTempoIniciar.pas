unit ncaFrmTempoIniciar;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxVGrid, cxDBVGrid, cxInplaceContainer, cxRadioGroup, cxContainer,
  cxLabel, cxPC, cxControls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxDropDownEdit, cxCurrencyEdit, Buttons, PngSpeedButton,
  cxButtonEdit, ncafbPesqCli, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, cxListBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, ncCredTempo, 
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, kbmMemTable,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ncClassesBase, ncTarifador,
  cxCheckBox, nxdb, dxBarExtItems, dxBar;

type

  TDadosTempo = object
  public  
    dtTipo      : Byte;
    dtMinutos   : Double;
    dtMaq       : Word;
    dtValor     : Currency;
    dtDadosCli  : TDadosCliente;
    dtPago      : Currency;
    dtDesc      : Currency;
    dtCodPassPac: Integer;
    dtNomePass  : String;
    dtSenha     : String;
    dtRecibo    : Boolean;
    dtTipoAcesso: Integer;
    dtObs       : String;
    dtCredValor : Boolean;
    dtFidResgate: Boolean;
    dtFidPontos : Double;
    dtFunc      : String;
    
    function Igual(const aDT: TDadosTempo): Boolean;
    function TotalFinal: Currency;
    function PagoTotal: Boolean;
    procedure Limpa;

    procedure LoadFromCredTempo(aCT: TncCredTempo);
    procedure SaveToCredTempo(aCT: TncCredTempo);
  end;

  PDadosTempo = ^TDadosTempo;
    
  TFrmTempoIniciar = class(TForm)
    tcxlist: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    LMDSimplePanel2: TLMDSimplePanel;
    panTipo: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    edCli: TcxPopupEdit;
    lbMaq: TcxLabel;
    tTT: TkbmMemTable;
    tTTDescr: TStringField;
    tTTTipo: TSmallintField;
    tTTCodigo: TIntegerField;
    tTTMinutos: TIntegerField;
    tTTValor: TCurrencyField;
    tTTTipoAcesso: TIntegerField;
    dsTT: TDataSource;
    tPass: TnxTable;
    tPassID: TAutoIncField;
    tPassTipoPass: TIntegerField;
    tPassCliente: TIntegerField;
    tPassExpirou: TBooleanField;
    tPassSenha: TStringField;
    tPassPrimeiroUso: TDateTimeField;
    tPassTipoAcesso: TIntegerField;
    tPassTipoExp: TWordField;
    tPassExpirarEm: TDateTimeField;
    tPassMaxSegundos: TIntegerField;
    tPassSegundos: TIntegerField;
    tPassAcessos: TIntegerField;
    tPassDia1: TIntegerField;
    tPassDia2: TIntegerField;
    tPassDia3: TIntegerField;
    tPassDia4: TIntegerField;
    tPassDia5: TIntegerField;
    tPassDia6: TIntegerField;
    tPassDia7: TIntegerField;
    tPassTran: TIntegerField;
    tPassDataCompra: TDateTimeField;
    tPassValido: TBooleanField;
    tPassValor: TCurrencyField;
    tPassSessao: TIntegerField;
    LMDSimplePanel5: TLMDSimplePanel;
    lbDeb: TcxLabel;
    BarMgr: TdxBarManager;
    cbRecibo: TcxCheckBox;
    dxBarManager1Bar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    panTempo: TLMDSimplePanel;
    panTT: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDescr: TcxGridDBColumn;
    TVPontos: TcxGridDBColumn;
    GL: TcxGridLevel;
    LMDSimplePanel6: TLMDSimplePanel;
    panDetalhes: TLMDSimplePanel;
    panTot: TLMDSimplePanel;
    VG: TcxVerticalGrid;
    VGDesconto: TcxEditorRow;
    VGTotal: TcxEditorRow;
    VGPagoTotal: TcxEditorRow;
    VGVlPago: TcxEditorRow;
    VGPontos: TcxEditorRow;
    VGPontosCli: TcxEditorRow;
    VGObs: TcxEditorRow;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    panAtalhoTempo: TLMDSimplePanel;
    lbT6: TcxLabel;
    lbT5: TcxLabel;
    lbT4: TcxLabel;
    lbT3: TcxLabel;
    lbT2: TcxLabel;
    lbT1: TcxLabel;
    edTempo: TcxTimeEdit;
    cxLabel9: TcxLabel;
    cxLabel8: TcxLabel;
    edValor: TcxCurrencyEdit;
    lbTempo: TcxLabel;
    lbSenha: TcxLabel;
    edSenha: TcxTextEdit;
    lbErroCartao: TcxLabel;
    TVTipo: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbT1Click(Sender: TObject);
    procedure lbT1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure edCliPropertiesCloseUp(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure edValorPropertiesEditValueChanged(Sender: TObject);
    procedure edValorPropertiesChange(Sender: TObject);
    procedure edTempoPropertiesEditValueChanged(Sender: TObject);
    procedure edTempoPropertiesChange(Sender: TObject);
    procedure edTipoAcessoPropertiesEditValueChanged(Sender: TObject);
    procedure edValorEnter(Sender: TObject);
    procedure edTempoEnter(Sender: TObject);
    procedure cxLabel8Click(Sender: TObject);
    procedure cxLabel9Click(Sender: TObject);
    procedure VGDescontoEditPropertiesEditValueChanged(Sender: TObject);
    procedure edDescontoPropertiesEditValueChanged(Sender: TObject);
    procedure VGItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure VGDescontoEditPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VGPagoTotalEditPropertiesChange(Sender: TObject);
    procedure edSenhaPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VGDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure TVCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure TVDescrCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVDescrGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    FDados      : PDadosTempo;
    FCalculando : Boolean;
    FCalcTempo  : Boolean;
    FDesconto   : Double;
    FResultado  : Boolean;
    FTar        : TncTarifador;
    FNovo       : Boolean;
    FSenhaAnt   : String;
    FCliAnt     : Integer;
    FShowed     : Boolean;
    FTACli      : Integer;
    FDebAnt     : Currency;
    FMinutosT   : Double;
    FValorT     : Currency;
    FTipoAcesso : Integer;

    function GetValor: Double;
    function GetTipoAcesso: Integer;
    procedure AtualizaVisTipoAcesso;
    procedure Totalizar;
    procedure RefreshTACli;
    function GetDesc: Double;

    function FidResg: Boolean;

    { Private declarations }
  public
    function Editar(const aNovo, aSalvar: Boolean; aDados: PDadosTempo; aTran: Integer; aMostraAvulso: Boolean = False; aMinutosT: Double=0; aValorT: Currency=0): Boolean;

    property TipoAcesso: Integer
      read FTipoAcesso write FTipoAcesso;
    { Public declarations }
  end;

var
  FrmTempoIniciar: TFrmTempoIniciar;

implementation

uses ncaDM, ncIDRecursos, ncaFrmPri;

{$R *.dfm}

procedure TFrmTempoIniciar.Totalizar;
begin
  VGTotal.Properties.Value := GetValor - FDesconto;
  if (vgPagoTotal.Properties.Value=True) or (vgVlPago.Properties.Value > vgTotal.Properties.Value) then
    vgVlpago.Properties.Value := vgTotal.Properties.Value; 
end;

procedure TFrmTempoIniciar.AtualizaVisTipoAcesso;
var 
  M : Integer;
begin
  edSenha.Visible := (Dados.mtTTTipo.Value = tctCartaoTempo);
  lbSenha.Visible := edSenha.Visible;
  lbErroCartao.Visible := False;
  with Dados do begin
    case mtTTTipo.Value of
      tctAvulso, tctPrevisao : begin
        lbTempo.Visible := False;
        edtempo.Visible := True;
      end;
      tctPassaporte : begin
        edTempo.Visible := False;
        M := mtTTMinutos.Value;
        if M < 60 then
          lbTempo.Caption := mtTTMinutos.AsString+'m'
        else begin
          lbTempo.Caption := IntToStr(M div 60)+'h';
          if (M mod 60)>0 then
            lbTempo.Caption := lbTempo.Caption + IntToStr(M mod 60) + 'm';
        end;  
        lbTempo.Visible := True;
      end;

      tctCartaoTempo : begin
        edTempo.Visible := False; 
        lbTempo.Visible := True;
        edSenhaPropertiesChange(nil);
        if FShowed and FNovo then 
          edSenha.SetFocus;
      end;
      
      tctPacote : begin
        edTempo.Visible := False;

        M := mtTTMinutos.Value;
        if M < 60 then
          lbTempo.Caption := mtTTMinutos.AsString+'m'
        else begin
          lbTempo.Caption := IntToStr(M div 60)+'h';
          if (M mod 60)>0 then
            lbTempo.Caption := lbTempo.Caption + IntToStr(M mod 60) + 'm';
        end;  
        
        lbTempo.Visible := True;
      end;
    end;  
  end;
  
  Totalizar;
end;

procedure TFrmTempoIniciar.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTempoIniciar.btnSalvarClick(Sender: TObject);
var 
  Debitar: Currency;
  Ind: Integer;
begin
  with FDados^, Dados do begin
    VG.HideEdit;
    dtTipo      := mtTTTipo.Value;
    if dtTipo = tctCartaoTempo then begin
      if lbErroCartao.Visible then 
        Raise ENexCafe.Create('Esse cartão já foi vendido para outro cliente')
      else
      if dtCodPassPac=-1 then
      if Trim(edSenha.Text)='' then
        Raise ENexCafe.Create('Não existe cartão com a senha informada') else
        Raise ENexCafe.Create('Informa a senha do cartão a ser vendido');
    end;
    
    dtRecibo    := cbRecibo.Checked;
    case dtTipo of
       tctPrevisao..tctAvulso : begin
         dtMinutos := edTempo.Time * 24 * 60;
         dtValor   := edValor.Value;
       end;
       tctCartaoTempo : begin
         dtMinutos := tPass.FieldByName('MaxSegundos').AsInteger / 60;
         dtValor   := edValor.Value;
       end;
    else 
      dtMinutos := mtTTMinutos.Value;
      dtValor   := mtTTValor.Value;
      dtFidPontos := 0;
    end;

    dtDesc      := VGDesconto.Properties.Value;
    if dtTipo in [tctPacote, tctPassaporte] then begin
      dtCodPassPac:= mtTTCodigo.Value;
      dtNomePass  := mtTTDescr.Value;
    end;
    dtSenha     := edSenha.Text;
    dtObs := vgObs.Properties.Value;

    if dtTipo=tctPassaporte then 
      dtTipoAcesso := mtTTTipoAcesso.Value;

    if VGPagoTotal.Properties.Value then
      dtPago := TotalFinal else
      dtPago := VGVlPago.Properties.Value;

    if dtTipo=tctPrevisao then begin
      dtValor := 0;
      dtDesc  := 0;
      dtPago  := 0;
    end;
  end;
  FResultado := True;
end;

procedure TFrmTempoIniciar.lbT1Click(Sender: TObject);
begin
  edTempo.SetFocus;
  edTempo.Time := edTempo.Time + MinutosToDateTime(TControl(Sender).Tag);
end;

procedure TFrmTempoIniciar.lbT1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    lbT1Click(Sender);
    btnSalvarClick(nil);
  end;
end;

procedure TFrmTempoIniciar.cxLabel8Click(Sender: TObject);
begin
  if not FidResg then
    edValor.SetFocus;
end;

procedure TFrmTempoIniciar.cxLabel9Click(Sender: TObject);
begin
  if (not FidResg) and edTempo.Visible then
    edTempo.SetFocus;
end;

procedure TFrmTempoIniciar.edCliPropertiesCloseUp(Sender: TObject);
begin
  edCli.Text := FDados^.dtDadosCli.dcNome;
  lbMaq.Visible := (FCliAnt=FDados^.dtDadosCli.dcCodigo) and (FDados^.dtMaq>0);
  if FShowed then begin
    RefreshTACli;
    GetTipoAcesso;
  end;
end;

procedure TFrmTempoIniciar.edDescontoPropertiesEditValueChanged(Sender: TObject);
begin
  Totalizar;
end;

function TFrmTempoIniciar.Editar(const aNovo, aSalvar: Boolean; aDados: PDadosTempo; aTran: Integer; aMostraAvulso: Boolean = False; aMinutosT: Double=0; aValorT: Currency=0): Boolean;
begin
  if gConfig.ContinuarCredTempo then begin
    FMinutosT := aMinutosT;
    FValorT := aValorT;
  end else begin
    FMinutosT := 0;
    FValorT := 0;
  end;
  FDados := aDados;
  FNovo := aNovo;

  Dados.mtTT.Filter := '';
  Dados.mtTT.Filtered := False;
  
  if aNovo then begin
    aDados.dtCredValor := gConfig.CreditoComoValor;
    aDados.dtTipo := Dados.CM.Config.CredPadraoTipo;
    aDados.dtCodPassPac := Dados.CM.Config.CredPadraoCod;
    aDados.dtFunc := Dados.CM.UA.Username;
  end else
  with FDados^.dtDadosCli do 
  if (dcCodigo>0) and Dados.tbCli.Locate('ID', dcCodigo, []) then
    dcNome := Dados.tbCliNome.Value;
  
  FSenhaAnt := aDados.dtSenha;
  FCliAnt := aDados.dtDadosCli.dcCodigo;
  cmSalvar.Enabled := aNovo or (aSalvar and Permitido(daTraAlterar));
  panTempo.Enabled := aNovo;
  Grid.Enabled := aNovo;
  cbRecibo.Visible := (Dados.CM.Config.RecImprimir>0);
  cbRecibo.Checked := aNovo and (Dados.CM.Config.RecImprimir=2);
  vgDesconto.Properties.Value := FDados^.dtDesc;
  edValor.Value := FDados^.dtValor;
  vgDesconto.Properties.Value := FDados^.dtDesc;
  FDesconto := FDados^.dtDesc;
  vgTotal.Properties.Value := FDados^.TotalFinal;
  vgObs.Properties.Value := FDados^.dtObs;
  if aNovo then
    vgPagoTotal.Properties.Value := Dados.CM.Config.PgTempo else
    vgPagoTotal.Properties.Value := FDados^.PagoTotal;
  vgVlPago.Properties.Value := FDados^.dtPago;
  edCli.Text := FDados^.dtDadosCli.dcNome;
  edCli.Enabled := (FDados^.dtMaq=0);
  lbMaq.Visible := (FDados^.dtMaq>0);
  lbMaq.Caption := 'Maq: '+IntToStr(FDados^.dtMaq);
  edCli.Enabled := aMostraAvulso;
  
  with Dados do
  if aDados.dtTipo in [tctPrevisao, tctAvulso, tctCartaoTempo] then 
    mtTT.Locate('Tipo', aDados.dtTipo, []) else
    mtTT.Locate('Tipo; Codigo', VarArrayOf([aDados.dtTipo, aDados.dtCodPassPac]), []);
    
  edSenha.Text := FDados^.dtSenha;
  edCliPropertiesCloseUp(nil);
end;

procedure TFrmTempoIniciar.edSenhaPropertiesChange(Sender: TObject);
var M : Integer;
begin
  if FCalculando then Exit;

  if not tPass.FindKey([edSenha.Text]) then begin
    lbTempo.Caption := '';
    edValor.Value := 0;
    lbErroCartao.Visible := False;
    FDados^.dtCodPassPac := -1;
  end else begin
    lbErroCartao.Visible := (FSenhaAnt <> edSenha.Text) and tPassValido.Value;
    FDados^.dtCodPassPac := tPassTipoPass.Value;
    edValor.Value := tPassValor.Value;
    
    FDados^.dtTipoAcesso := tPassTipoAcesso.Value;
    M := tPassMaxSegundos.Value div 60;
    if M < 60 then
      lbTempo.Caption := IntToStr(M)+'m'
    else begin
      lbTempo.Caption := IntToStr(M div 60)+'h';
      if (M mod 60)>0 then
        lbTempo.Caption := lbTempo.Caption + IntToStr(M mod 60) + 'm';
    end;  
  end;
  if FShowed then
    VGPagoTotalEditPropertiesChange(nil);
end;

procedure TFrmTempoIniciar.edTempoEnter(Sender: TObject);
begin
  edTempo.SelectAll;
end;

procedure TFrmTempoIniciar.edTempoPropertiesChange(Sender: TObject);
begin
  edTempo.PostEditValue;
end;

procedure TFrmTempoIniciar.edTempoPropertiesEditValueChanged(Sender: TObject);
begin
  if FCalculando then Exit;
  if not FNovo then Exit;
  
  FCalculando := True;
  FCalcTempo := True;
  try
    FTar.IDTipoAcesso := GetTipoAcesso;
    FTar.PCredito^.Minutos := 0;
    FTar.CredValor := 0;
    FTar.Reset;
    FTar.Inicio := Now;
    FTar.NumTicks := DateTimeToTicks(edTempo.Time) + MinutosToTicks(FMinutosT);
    edValor.EditValue := FloatToStr(FTar.Valor-FValorT);
    Totalizar;
    if vgPagoTotal.Properties.Value then
      vgVlPago.Properties.Value := vgTotal.Properties.Value 
    else
    if vgVlPago.Properties.Value > vgTotal.Properties.Value then
      vgVlPago.Properties.Value := 0;
  finally
    FCalculando := False;
  end;  
end;

procedure TFrmTempoIniciar.edTipoAcessoPropertiesEditValueChanged(Sender: TObject);
begin
  if not FShowed then Exit;
  
  if not FCalculando then begin
    if FCalcTempo then
      edTempoPropertiesEditValueChanged(nil) else
      edValorPropertiesEditValueChanged(nil);
  end;
end;

procedure TFrmTempoIniciar.edValorEnter(Sender: TObject);
begin
  edValor.SelectAll;
end;

procedure TFrmTempoIniciar.edValorPropertiesChange(Sender: TObject);
begin
  if FShowed then
    edValor.PostEditValue;
end;

procedure TFrmTempoIniciar.edValorPropertiesEditValueChanged(Sender: TObject);
var 
  NumTicks: Cardinal;
  H, M, S, MS: Word;
begin
  if not FShowed then Exit;
  if not FNovo then Exit;
  
  
  if FCalculando then Exit;
  FCalcTempo := False;
  FCalculando := True;
  try
    with Dados.CM do  begin
      FTar.Inicio := Now;
      FTar.IDTipoAcesso := GetTipoAcesso;
      FTar.CredValor := GetValor + FValorT;
      FTar.PCredito^.Minutos := 0;
      NumTicks := FTar.TempoCredValor(False);
      DecodeTime(TicksToDateTime(NumTicks), H, M, S, MS);
      edTempo.Time := TicksToDateTime(NumTicks - MinutosToTicks(FMinutosT));
    end;   
    Totalizar;
    if vgPagoTotal.Properties.Value then
      vgVlPago.Properties.Value := vgTotal.Properties.Value 
    else
    if vgVlPago.Properties.Value > vgTotal.Properties.Value then
      vgVlPago.Properties.Value := 0;
  finally
    FCalculando := False;
  end;    
end;

function TFrmTempoIniciar.FidResg: Boolean;
begin
  Result := FDados^.dtFidResgate;
end;

procedure TFrmTempoIniciar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTempoIniciar.FormCreate(Sender: TObject);
begin
  FTACli := -1;
  FDebAnt := 0;
  FShowed := False;
  with Dados.CM.Config do begin
    lbT1.Tag := TempoB1;
    lbT2.Tag := TempoB2;
    lbT3.Tag := TempoB3;
    lbT4.Tag := TempoB4;
    lbT5.Tag := TempoB5;
    lbT6.Tag := TempoB6;

    lbT1.Caption := MinutosToHmsStr(TempoB1);
    lbT2.Caption := MinutosToHmsStr(TempoB2);
    lbT3.Caption := MinutosToHmsStr(TempoB3);
    lbT4.Caption := MinutosToHmsStr(TempoB4);
    lbT5.Caption := MinutosToHmsStr(TempoB5);
    lbT6.Caption := MinutosToHmsStr(TempoB6);

    lbT1.Visible := (TempoB1>0);
    lbT2.Visible := (TempoB2>0);
    lbT3.Visible := (TempoB3>0);
    lbT4.Visible := (TempoB4>0);
    lbT5.Visible := (TempoB5>0);
    lbT6.Visible := (TempoB6>0);
  end;
  tPass.Open;
  FNovo := False;
  FTar := TncTarifador.Create;
  FResultado := False;
  FDesconto := 0;
  FCalculando := True;
  FDados := nil;
  try
    lbTempo.Left := edTempo.Left;
    lbTempo.Top  := edTempo.Top;
    Dados.RefreshTipoCred(False, True);
//    AtualizaVisTipoAcesso;
  finally
    FCalculando := False;
  end;
end;

procedure TFrmTempoIniciar.FormDestroy(Sender: TObject);
begin
  Dados.mtTT.Filter := '';
  Dados.mtTT.Filtered := False;
  FTar.Free;
end;

procedure TFrmTempoIniciar.FormShow(Sender: TObject);
var I : Integer;
begin
  with FDados^ do 
  if (dtMaq=0) and (dtDadosCli.dcCodigo>0) and (dtTipo<>tctPrevisao) then
    FDebAnt := TotalFinal - dtPago else
    FDebAnt := 0;

  FShowed := True;
  GetTipoAcesso;
  if FDados^.dtTipo = tctCartaoTempo then
    edSenhaPropertiesChange( nil);
    
  if FNovo and (FDados^.dtDadosCli.dcCodigo>0) then begin
    RefreshTACli;
    GetTipoAcesso;
  end;
end;

function TFrmTempoIniciar.GetDesc: Double;
begin
  try
    Result := VGDesconto.Properties.Value;
  except
    Result := 0;
  end;
end;

function TFrmTempoIniciar.GetTipoAcesso: Integer;
var I : Integer;
begin
  with Dados do begin
    Result := FDados^.dtTipoAcesso;
    if (mtTTTipo.Value in [tctAvulso, tctPrevisao]) and (FTACli<>-1) and (FTACli<>Result) then begin
      if gTiposAcesso.PorCodigo[FTACli]<>nil then
        Result := FTACli;
    end;
  end;
end;

function TFrmTempoIniciar.GetValor: Double;
begin
  try
    Result := edValor.EditValue;
  except
    Result := 0;
  end;
end;

procedure TFrmTempoIniciar.RefreshTACli;
var V: Variant;
begin
  V := Dados.tbCli.Lookup('ID', FDados^.dtDadosCli.dcCodigo, 'TipoAcessoPref');
  if (V=null) or (gTiposAcesso.ItemPorChave[V]=nil) then
    FTACli := -1 else
    FTACli := V;
end;

procedure TFrmTempoIniciar.TVCanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
var V: Variant;  
begin
  V := ARecord.Values[TVTipo.Index];
  AAllow := (V=null) or (V<>tctDiv);
end;

procedure TFrmTempoIniciar.TVDescrCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := AViewInfo.GridRecord.Values[TVTipo.Index];
  if (V<>null) and (V=tctDiv) then
    ACanvas.Font.Color := clGray;
end;

procedure TFrmTempoIniciar.TVDescrGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVTipo.Index];
  if (V=null) or (V<>tctDiv) then
    AText := '   ' + AText;
end;

procedure TFrmTempoIniciar.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if not FShowed then Exit;

  panDetalhes.Visible := (Dados.mtTTTipo.Value <> tctLivre);
  

  FCalculando := True;
  with Dados do
  try
    if not FidResg then begin
      if FNovo and (not (panAtalhoTempo.Visible and (mtTTTipo.Value in [tctAvulso, tctPrevisao]))) then
      begin
        edValor.Value := Dados.mtTTValor.Value;
        edTempo.Time  := Dados.mtTTMinutos.Value / 60 / 24;
        Totalizar;
        if vgPagoTotal.Properties.Value then
          vgVlPago.Properties.Value := vgTotal.Properties.Value else
          vgVlPago.Properties.Value := 0;
      end;
            
      VG.Visible := (Dados.mtTTTipo.Value  <> tctPrevisao);
    end else 
      vgPontos.Properties.Value := Dados.mtTTPontos.Value;
      
    panAtalhoTempo.Visible := (Dados.mtTTTipo.Value in [tctAvulso, tctPrevisao]);
    edValor.Properties.ReadOnly := not panAtalhoTempo.Visible;
    AtualizaVisTipoAcesso;
  finally
    FCalculando := False;
  end;
end;

procedure TFrmTempoIniciar.VGDescontoEditPropertiesChange(Sender: TObject);
var V: Variant;
begin
  if not FShowed then Exit;

  V := TcxCurrencyEdit(Sender).EditingValue;
  if V=null then
    FDesconto := 0 else
    FDesconto := V;
  Totalizar;
end;

procedure TFrmTempoIniciar.VGDescontoEditPropertiesEditValueChanged(Sender: TObject);
begin
  if not FShowed then Exit;
  
  Totalizar;
end;

procedure TFrmTempoIniciar.VGDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmTempoIniciar.VGItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
  AOldCellIndex: Integer);
begin
  Totalizar;
end;

procedure TFrmTempoIniciar.VGPagoTotalEditPropertiesChange(Sender: TObject);
begin
  if vgPagoTotal.Properties.Value then
    vgVlPago.Properties.Value := vgTotal.Properties.Value else
    vgVlPago.Properties.Value := 0;
end;

{ TDadosTempo }

function TDadosTempo.Igual(const aDT: TDadosTempo): Boolean;
begin
  Result := False;
  if dtTipo <> aDT.dtTipo then Exit;
  if dtMinutos <> aDT.dtMinutos then Exit;
  if dtValor <> aDT.dtValor then Exit;
  if dtDadosCli.dcCodigo <> aDT.dtDadosCli.dcCodigo then Exit;
  if dtPago <> aDT.dtPago then Exit;
  if dtDesc <> aDT.dtDesc then Exit;
  if dtCodPassPac <> aDT.dtCodPassPac then Exit;
  if dtMaq <> aDT.dtMaq then Exit;
  if dtSenha <> aDT.dtSenha  then Exit;
  if dtObs <> aDT.dtObs then Exit;
  if dtCredValor <> aDT.dtCredValor then Exit;
  if dtFidResgate <> aDT.dtFidResgate then Exit;
  if dtFidPontos <> aDT.dtFidPontos then Exit;
  
  Result := True;
end;

procedure TDadosTempo.Limpa;
begin
  dtTipo      := 0;
  dtMaq       := 0;
  dtMinutos   := 0;
  dtValor     := 0;
  dtDadosCli.dcCodigo := 0;
  dtDadosCli.dcNome := '';
  dtPago      := 0;
  dtDesc      := 0;
  dtCodPassPac:= 0;
  dtNomePass  := '';
  dtSenha := '';
  dtObs := '';
  dtTipoAcesso := -1;
  dtCredValor := False;
  dtFidPontos := 0;
  dtFidResgate := False;
end;

procedure TDadosTempo.LoadFromCredTempo(aCT: TncCredTempo);
begin
  dtFunc := aCT.teFunc;
  dtTipo := aCT.teTipo;
  dtMaq  := aCT.teMaq;
  dtMinutos := aCT.teMinutos;
  dtValor := aCT.teTotal;
  dtDadosCLi.dcCodigo := aCT.teCliente;
  dtPago := aCT.tePago;
  dtDesc := aCT.teDesconto;
  dtCodPassPac := aCT.teIDPacPass;
  dtNomePass := '';
  dtSenha := aCT.teSenha;
  dtTipoAcesso := aCT.teTipoAcesso;
  dtObs := aCT.teObs;
  dtCredValor := aCT.teCredValor;
  dtFidResgate := aCT.teFidResgate;
  dtFidPontos := aCT.teFidPontos;
end;

function TDadosTempo.PagoTotal: Boolean;
begin
  Result := (Abs(TotalFinal - dtPago) < 0.01);
end;

procedure TDadosTempo.SaveToCredTempo(aCT: TncCredTempo);
begin
  aCT.teTipo := dtTipo;
  aCT.teMaq := dtMaq ;
  aCT.teMinutos := dtMinutos;
  aCT.teTotal := dtValor;
  aCT.teCliente := dtDadosCli.dcCodigo;
  aCT.tePago := dtPago;
  aCT.teDesconto := dtDesc;
  aCT.teIDPacPass := dtCodPassPac;
  aCT.teSenha := dtSenha;
  aCT._Recibo := dtRecibo;
  aCT.teTipoAcesso := dtTipoAcesso;
  aCT.teObs := dtObs;
  aCT.teCredValor := dtCredValor;
  aCT.teFidResgate := dtFidResgate;
  aCT.teFidPontos := dtFidPontos;
  aCT.teFunc := dtFunc;
end;

function TDadosTempo.TotalFinal: Currency;
begin
  if dtFidResgate then
    Result := 0 else
    Result := dtValor - dtDesc;
end;

end.
