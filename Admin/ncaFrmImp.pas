unit ncaFrmImp;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxDropDownEdit, cxCurrencyEdit,
  cxMaskEdit, cxRadioGroup, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, DB, kbmMemTable, dxBar,
  dxBarExtItems, cxVGrid, cxDBVGrid, cxInplaceContainer, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxSpinEdit, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  ncImpressao, ncafbPesqCli, cxContainer, cxCheckBox, ExtCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, ncaFrmTotal, ncaFrmCli, cxTextEdit, cxLabel,
  cxNavigator;

type
  TFrmImp = class(TForm)
    panCli: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVQuant: TcxGridColumn;
    TVTotal: TcxGridColumn;
    GL: TcxGridLevel;
    TVTipo: TcxGridColumn;
    cmRecibo: TdxBarControlContainerItem;
    Timer1: TTimer;
    cbRecibo: TcxCheckBox;
    panTotais: TLMDSimplePanel;
    cmMaq: TdxBarStatic;
    panDadosImp: TLMDSimplePanel;
    LMDLabel4: TLMDLabel;
    panGrupoTar: TLMDSimplePanel;
    lbGrupoTar: TcxLabel;
    panObs: TLMDSimplePanel;
    lbObs: TcxLabel;
    edQtd: TcxTextEdit;
    edImpressora: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure Timer1Timer(Sender: TObject);
    procedure TVQuantPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FImp : TncImpressao;
    FRes : Boolean;
    FNovo : Boolean;
    FLoading : Boolean;
    FCliAnt : Integer;
    FDebAnt : Currency;
    FTot    : TFrmTotal;
    FCli    : TFrmCli;
    
    { Private declarations }
    procedure LeTipos;
    procedure AtualizaTotais;
  public
    function Editar(aNovo: Boolean; aSalvar: Boolean; aImp: TncImpressao): Boolean;
    { Public declarations }
  end;

var
  FrmImp: TFrmImp;

implementation

uses ncaDM, ncIDRecursos, ncaFrmPri, ncClassesBase, ufmImagens;

// START resource string wizard section
resourcestring
  SParaFicarEmDébitoéNecessárioSele = 'Para ficar em débito é necessário selecionar um cliente';
  SOLimiteMáximoDeDébitoPermitidoPa = 'O limite máximo de débito permitido para esse cliente foi ultrapassado';
  SMaq = 'Maq.';
  SR0 = 'R$ 0';
  SR000 = 'R$ 0,00';

// END resource string wizard section


{$R *.dfm}

{ TFrmImp }

procedure TFrmImp.AtualizaTotais;
begin
  FTot.SubTotal := FImp.Total;
end;

procedure TFrmImp.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImp.cmGravarClick(Sender: TObject);
var Debitar, V : Currency;
begin
  FImp.impCliente := FCli.Codigo;
  FImp.impPago := FTot.Pago;
  FImp.impDesconto := FTot.Desconto;
  FImp._Recibo := cbRecibo.Checked;
  if FNovo or FImp.impManual then 
    FImp.impPaginas := FImp.TotQuant;

  if (FImp.Debito>0.009) then begin
    if (FImp.impCliente=0) then
      Raise ENexCafe.Create(SParaFicarEmDébitoéNecessárioSele);
    if FImp.impCliente <> FCliAnt then FDebAnt := 0;
    Debitar := FImp.Debito-FDebAnt;
    with Dados do
    if Debitar>0.009 then begin
      tbCli.Locate('ID', FImp.impCliente, []); // do not localize
      if LimiteDebito(tbCliLimiteDebito) <  (tbCliDebito.Value + Debitar) then
        Raise ENexCafe.Create(SOLimiteMáximoDeDébitoPermitidoPa);
    end;
  end;


  Close;
  FRes := True;
end;

function TFrmImp.Editar(aNovo, aSalvar: Boolean; aImp: TncImpressao): Boolean;
begin
  with Dados.CM.Config do begin
    if RecImprimir>0 then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;
      
    cbRecibo.Checked := aNovo and (RecImprimir=2);
  end;

  if aImp.impSessao>0 then FTot.PagarFimAcesso;

  FImp := aImp;
  cmMaq.Caption := SMaq+IntToStr(aImp.impMaquina);
  edImpressora.Text := FImp.impImpressora;
  edQtd.Text := IntToStr(FImp.impPaginas);
  FCli.Init(False, False, aImp.impCliente, '', '', 0, panCli);
  FCli.CliCad := aImp.impCliente;
  panDadosImp.Visible := (not aImp.impManual);
  FNovo := aNovo;
  cmGravar.Enabled := aSalvar and (aNovo or Permitido(daTraAlterar));
  Result := FRes;
  panCli.Enabled := (FImp.impSessao=0);
  if FImp.impMaquina>0 then 
    cmMaq.Visible := ivAlways;

  LeTipos;
  FTot.InitVal(FImp.impPagEsp, FImp.Total, FImp.impDesconto, FImp.impPago, 0, '', panTotais);
  
  if aNovo then begin
    if gConfig.PgImp then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 2;
  end else
    if (Abs(FImp.Total - FImp.impDesconto - FImp.impPago)<0.01) then
      FTot.OpPagto := 1 else
      FTot.OpPagto := 0;
    
  if (not aNovo) and (not FImp.impManual) and (not Permitido(daAlteraImpressao)) then
    cmGravar.Enabled := False;
     
  ShowModal;
  Result := FRes;
end;

procedure TFrmImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImp.FormCreate(Sender: TObject);
begin
  FRes := False;
  FLoading := False;
  FTot := TFrmTotal.Create(Self);
  FCli := gCliList.GetFrm;
end;

procedure TFrmImp.FormDestroy(Sender: TObject);
begin
  FTot.Free;
  gCliList.ReleaseFrm(FCli);
end;

procedure TFrmImp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : 
      if (not (ssCtrl in Shift)) and FCli.edCad.Focused then begin
        Grid.SetFocus;
      end else
      if (cmGravar.Enabled) then
      if ((ssCtrl in Shift) or (FTot.edRec.Focused)) then 
        cmGravarClick(nil);
        
    Key_Esc   : Close;

    $7B {F12} : FTot.edRec.SetFocus;
  end;
end;

procedure TFrmImp.FormShow(Sender: TObject);
begin
  FCliAnt := FImp.impCliente;
  FDebAnt := FImp.Debito;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmImp.LeTipos;
begin
  FLoading := True;
  try
    with TV.DataController, Dados do begin
      mtTipoImp.First;
      while not mtTipoImp.Eof do begin
        if mtTipoImpID.Value in [1..10] then begin
          AppendRecord;
//          if FNovo then
            FImp.impValor[mtTipoImpID.Value] := mtTipoImpValor.Value;
          Values[RecordCount-1, 0] := mtTipoImpID.Value;
          Values[RecordCount-1, 1] := FImp.QuantPorTipo(mtTipoImpID.Value);
          Values[RecordCount-1, 2] := FImp.TotalPorTipo(mtTipoImpID.Value);
        end;
        mtTipoImp.Next;
      end;
    end;
  finally
    FLoading := False;
  end;
end;

procedure TFrmImp.Timer1Timer(Sender: TObject);
var 
  T, Q: Variant;
  I: Integer;
begin
  Timer1.Enabled := False;
  with TV.DataController do begin
    Q := Values[FocusedRecordIndex, 1];
    T := Values[FocusedRecordIndex, 0];
    if T<>null then begin
      I := T;
      FImp.impQuant[I] := Q;
      Values[FocusedRecordIndex, 2] := FImp.TotalPorTipo(I);
      AtualizaTotais;
    end;
  end;
end;

procedure TFrmImp.TVQuantPropertiesEditValueChanged(Sender: TObject);
begin
  if FLoading then Exit;
  Timer1.Enabled := True;
end;

procedure TFrmImp.TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if (AText=SR0) or (AText=SR000) then AText := '';
end;

end.

