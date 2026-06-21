unit ucmaFrmTempo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxVGrid, cxDBVGrid, cxInplaceContainer, cxRadioGroup, cxContainer,
  cxLabel, cxPC, cxControls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxDropDownEdit, cxCurrencyEdit, Buttons, PngSpeedButton,
  cxButtonEdit, ucmafbPesqCli, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, cxListBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, kbmMemTable,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cmClassesBase;

type

  TDadosTempo = object
  public  
    dtTipo      : Byte;
    dtMinutos   : Integer;
    dtValor     : Currency;
    dtDadosCli  : TDadosCliente;
    dtPago      : Boolean;
    dtDesc      : Currency;
    dtCodPassPac: Integer;
    dtNomePass  : String;      
    
    function Igual(const aDT: TDadosTempo): Boolean;
    function TotalFinal: Currency;
    procedure Limpa;
  end;

  PDadosTempo = ^TDadosTempo;
    
  TFrmTempo = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    panTot: TLMDSimplePanel;
    panTempo: TLMDSimplePanel;
    panBotoes: TLMDSimplePanel;
    tcxlist: TcxStyleRepository;
    cxStyle1: TcxStyle;
    LMDSimplePanel9: TLMDSimplePanel;
    cxStyle2: TcxStyle;
    panAtalhoTempo: TLMDSimplePanel;
    edTempo: TcxTimeEdit;
    cxLabel9: TcxLabel;
    cxLabel8: TcxLabel;
    edValor: TcxCurrencyEdit;
    btnSalvar: TPngSpeedButton;
    btnCancelar: TPngSpeedButton;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    LMDSimplePanel2: TLMDSimplePanel;
    panTipo: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    edCli: TcxPopupEdit;
    edTipoAcesso: TcxComboBox;
    lbTempo: TcxLabel;
    lbMaq: TcxLabel;
    panTT: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDescr: TcxGridDBColumn;
    GL: TcxGridLevel;
    LMDSimplePanel4: TLMDSimplePanel;
    lbTipoAcesso: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    VG: TcxVerticalGrid;
    VGDesconto: TcxEditorRow;
    VGTotal: TcxEditorRow;
    VGPago: TcxEditorRow;
    mtTT: TkbmMemTable;
    mtTTDescr: TStringField;
    mtTTTipo: TSmallintField;
    mtTTCodigo: TIntegerField;
    mtTTMinutos: TIntegerField;
    mtTTValor: TCurrencyField;
    mtTTTipoAcesso: TIntegerField;
    dsTT: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLabel7Click(Sender: TObject);
    procedure cxLabel7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edCliPropertiesInitPopup(Sender: TObject);
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
    procedure lbTipoAcessoClick(Sender: TObject);
    procedure VGDescontoEditPropertiesEditValueChanged(Sender: TObject);
    procedure edDescontoPropertiesEditValueChanged(Sender: TObject);
    procedure VGItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure VGDescontoEditPropertiesChange(Sender: TObject);
  private
    FDados      : PDadosTempo;
    FCalculando : Boolean;
    FCalcTempo  : Boolean;
    FDesconto   : Double;
    FResultado  : Boolean;

    function GetValor: Double;
    function GetDesc: Double;
    procedure AtualizaVisTipoAcesso;
    procedure Totalizar;
    { Private declarations }
  public
    function Editar(const aNovo, aSalvar: Boolean; aDados: PDadosTempo): Boolean;
    { Public declarations }
  end;

var
  FrmTempo: TFrmTempo;

implementation

uses ucmaDM;

{$R *.dfm}

procedure TFrmTempo.Totalizar;
begin
  VGTotal.Properties.Value := GetValor - FDesconto;
end;

procedure TFrmTempo.AtualizaVisTipoAcesso;
var 
  TemTodos: Boolean;
  M : Integer;
begin
  edTipoAcesso.Visible := (edTipoAcesso.Properties.Items.Count>1);
  edTipoAcesso.Enabled := (Dados.mtTTTipo.Value=0);
  lbTipoAcesso.Visible := edTipoAcesso.Visible;
  with Dados do 
  with edTipoAcesso.Properties do begin
    TemTodos := SameText(Items[0], 'Todos');
    case mtTTTipo.Value of
      0 : begin
        if TemTodos then Items.Delete(0);
        if edTipoAcesso.ItemIndex=-1 then edTipoAcesso.ItemIndex := 0;
        lbTempo.Visible := False;
        edtempo.Visible := True;
      end;
      1 : begin
        edTempo.Visible := False;
        if not TemTodos then Items.InsertObject(0, 'Todos', TObject(-1));
        edTipoAcesso.ItemIndex := Items.IndexOfObject(TObject(mtTTTipoAcesso.Value));
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
      2 : begin
        edTempo.Visible := False;
        if not TemTodos then Items.InsertObject(0, 'Todos', TObject(-1));
        edTipoAcesso.ItemIndex := 0;
        lbTempo.Caption := IntToStr(mtTTMinutos.Value div 60) +'h';
        lbTempo.Visible := True;
      end;
    end;  
  end;
  Totalizar;
end;

procedure TFrmTempo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTempo.btnSalvarClick(Sender: TObject);
begin
  with FDados^ do begin
    dtTipo      := mtTTTipo.Value;
    if dtTipo=0 then begin
      dtMinutos := Trunc(edTempo.Time * 24 * 60) ;
      dtValor   := edValor.Value;
    end else begin
      dtMinutos := mtTTMinutos.Value;
      dtValor   := mtTTValor.Value;
    end;
    dtPago      := VGPago.Properties.Value;
    dtDesc      := VGDesconto.Properties.Value;
    dtCodPassPac:= mtTTCodigo.Value;
    dtNomePass  := mtTTDescr.Value;
  end;
  FResultado := True;
  Close;
end;

procedure TFrmTempo.cxLabel7Click(Sender: TObject);
begin
  edTempo.SetFocus;
  edTempo.Time := edTempo.Time + ((1 / 24 / 60) * TControl(Sender).Tag);
end;

procedure TFrmTempo.cxLabel7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    cxLabel7Click(Sender);
    Close;
  end;
end;

procedure TFrmTempo.cxLabel8Click(Sender: TObject);
begin
  edValor.SetFocus;
end;

procedure TFrmTempo.cxLabel9Click(Sender: TObject);
begin
  if edTempo.Visible then
    edTempo.SetFocus;
end;

procedure TFrmTempo.edCliPropertiesCloseUp(Sender: TObject);
begin
  edCli.Text := FDados^.dtDadosCli.dcNome;
end;

procedure TFrmTempo.edCliPropertiesInitPopup(Sender: TObject);
begin
  fbPesqCli.PreparaBusca(@FDados^.dtDadosCli, edCli);
end;

procedure TFrmTempo.edDescontoPropertiesEditValueChanged(Sender: TObject);
begin
  Totalizar;
end;

function TFrmTempo.Editar(const aNovo, aSalvar: Boolean; aDados: PDadosTempo): Boolean;
begin
  btnSalvar.Enabled := aNovo or aSalvar;
  FDados := aDados;
  vgDesconto.Properties.Value := FDados^.dtDesc;
  edValor.Value := FDados^.dtValor;
  vgDesconto.Properties.Value := FDados^.dtDesc;
  vgTotal.Properties.Value := FDados^.TotalFinal;
  vgPago.Properties.Value := FDados^.dtPago;
  edCli.Text := FDados^.dtDadosCli.dcNome;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmTempo.edTempoEnter(Sender: TObject);
begin
  edTempo.SelectAll;
end;

procedure TFrmTempo.edTempoPropertiesChange(Sender: TObject);
begin
  edTempo.PostEditValue;
end;

procedure TFrmTempo.edTempoPropertiesEditValueChanged(Sender: TObject);
var 
  NumTicks: Cardinal;
  TA : TCMTipoAcesso;
  Credito, TempoCobrado : Cardinal;
  Valor : Double;
begin
  if FCalculando then Exit;
  FCalculando := True;
  FCalcTempo := True;
  try
    with Dados, CM do  begin
      with edTipoAcesso, edTipoAcesso.Properties do
      TA := TiposAcesso.PorCodigo[Integer(Items.Objects[ItemIndex])];
      if TA <> nil then begin
          CalculaTempoValor(Now, 
                            DateTimeToTicks(edTempo.Time), 
                            0, TA.Codigo,
                            TA.PHoraCor^, CorPrecos, True,
                            nil, TempoCobrado, Credito, Valor);
        edValor.EditValue := FloatToStr(Valor);
      end;
    end;    
    Totalizar;
  finally
    FCalculando := False;
  end;  
end;

procedure TFrmTempo.edTipoAcessoPropertiesEditValueChanged(Sender: TObject);
begin
  if not FCalculando then begin
    if FCalcTempo then
      edTempoPropertiesEditValueChanged(nil) else
      edValorPropertiesEditValueChanged(nil);
  end;
end;

procedure TFrmTempo.edValorEnter(Sender: TObject);
begin
  edValor.SelectAll;
end;

procedure TFrmTempo.edValorPropertiesChange(Sender: TObject);
begin
  edValor.PostEditValue;
end;

procedure TFrmTempo.edValorPropertiesEditValueChanged(Sender: TObject);
var 
  NumTicks: Cardinal;
  TA : TCMTipoAcesso;
begin
  if FCalculando then Exit;
  FCalcTempo := False;
  FCalculando := True;
  try
    with Dados.CM do  begin
      with edTipoAcesso, edTipoAcesso.Properties do
      TA := TiposAcesso.PorCodigo[Integer(Items.Objects[ItemIndex])];
      if TA <> nil then begin
        NumTicks := ObtemTempo(Now, TA.Codigo, TA.PHoraCor^, CorPrecos, GetValor);
        edTempo.Time := TicksToDateTime(NumTicks);
      end;
    end;   
    Totalizar;
  finally
    FCalculando := False;
  end;    
end;

procedure TFrmTempo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTempo.FormCreate(Sender: TObject);
begin
  FResultado := False;
  FDesconto := 0;
  FCalculando := True;
  try
    lbTempo.Left := edTempo.Left;
    lbTempo.Top  := edTempo.Top;
    with Dados, edTipoAcesso.Properties do begin
      tbTipoAcesso.First;
      Items.Clear;
      while not tbTipoAcesso.Eof do begin
        Items.AddObject(tbTipoAcessoNome.Value, TObject(tbTipoAcessoCodigo.Value));
        tbTipoAcesso.Next;
      end;
    end;
    Dados.RefreshTipoCred;
    AtualizaVisTipoAcesso;
  finally
    FCalculando := False;
  end;
end;

function TFrmTempo.GetDesc: Double;
begin
  try
    Result := VGDesconto.Properties.Value;
  except
    Result := 0;
  end;
end;

function TFrmTempo.GetValor: Double;
begin
  try
    Result := edValor.EditValue;
  except
    Result := 0;
  end;
end;

procedure TFrmTempo.lbTipoAcessoClick(Sender: TObject);
begin
  if edTipoAcesso.Visible and edTipoAcesso.Enabled then
    edTipoAcesso.SetFocus;
end;

procedure TFrmTempo.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FCalculando := True;
  try
    edValor.Value := Dados.mtTTValor.Value;
    panAtalhoTempo.Visible := (Dados.mtTTTipo.Value=0);
    edTempo.Time  := (Dados.mtTTMinutos.Value / 60 ) / 24;
    edValor.Properties.ReadOnly := not panAtalhoTempo.Visible;
    AtualizaVisTipoAcesso;
  finally
    FCalculando := False;
  end;
end;

procedure TFrmTempo.VGDescontoEditPropertiesChange(Sender: TObject);
var V: Variant;
begin
  V := TcxCurrencyEdit(Sender).EditingValue;
  if V=null then
    FDesconto := 0 else
    FDesconto := V;
  Totalizar;
end;

procedure TFrmTempo.VGDescontoEditPropertiesEditValueChanged(Sender: TObject);
begin
  Totalizar;
end;

procedure TFrmTempo.VGItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
  AOldCellIndex: Integer);
begin
  Totalizar;
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
  Result := True;
end;

procedure TDadosTempo.Limpa;
begin
  dtTipo      := 0;
  dtMinutos   := 0;
  dtValor     := 0;
  dtDadosCli.dcCodigo := 0;
  dtDadosCli.dcNome := '';
  dtPago      := False;
  dtDesc      := 0;
  dtCodPassPac:= 0;
  dtNomePass  := '';
end;

function TDadosTempo.TotalFinal: Currency;
begin
  Result := dtValor - dtDesc;
end;

end.
