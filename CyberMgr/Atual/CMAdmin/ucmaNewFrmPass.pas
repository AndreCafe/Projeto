unit ucmaNewFrmPass;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  LMDCustomComponent, LMDApplicationCtrl, dxBar, Db, kbmMemTable, dxDBTLCl,
  nxdb, dxBarExtItems,   StdCtrls, ovcbase,
  ovcef, ovcpb, ovcpf, cmClassesBase, ovcnf, LMDButtonControl,
  LMDRadioButton, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCalendar, cxMaskEdit, cxDropDownEdit,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGridLevel, cxGrid,
  cxImageComboBox, cxDBLookupComboBox, cxLabel, LMDCustomParentPanel,
  LMDCustomGroupBox, LMDCustomButtonGroup, LMDCustomRadioGroup,
  LMDRadioGroup, pngimage, cxGroupBox, cxRadioGroup, cxCheckBox;

type
  TFrmPassaporte = class(TForm)
    BarMgr: TdxBarManager;
    dxBarDockControl2: TdxBarDockControl;
    cmGravar: TdxBarLargeButton;
    Paginas: TcxPageControl;
    tsRegras: TcxTabSheet;
    tsHist: TcxTabSheet;
    tHist: TnxTable;
    tHistTransacao: TIntegerField;
    tHistDataHora: TDateTimeField;
    Label9: TLabel;
    DataSource1: TDataSource;
    dsHist: TDataSource;
    tHistUsadoM: TFloatField;
    tHistUsadoH: TFloatField;
    tHistPassaporte: TIntegerField;
    tHistSegundos: TIntegerField;
    tHistNumSeq: TAutoIncField;
    cmForcaExpirar: TdxBarLargeButton;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    TV: TcxGridDBBandedTableView;
    TVDataHora: TcxGridDBBandedColumn;
    TVUsadoH: TcxGridDBBandedColumn;
    TVUsadoM: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    ts: TcxTabSheet;
    panHorarios: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    hora723: TLMDSpeedButton;
    hora722: TLMDSpeedButton;
    hora721: TLMDSpeedButton;
    hora720: TLMDSpeedButton;
    hora719: TLMDSpeedButton;
    hora718: TLMDSpeedButton;
    hora717: TLMDSpeedButton;
    hora716: TLMDSpeedButton;
    hora715: TLMDSpeedButton;
    hora714: TLMDSpeedButton;
    hora70: TLMDSpeedButton;
    hora71: TLMDSpeedButton;
    hora72: TLMDSpeedButton;
    hora73: TLMDSpeedButton;
    hora74: TLMDSpeedButton;
    hora75: TLMDSpeedButton;
    hora76: TLMDSpeedButton;
    hora77: TLMDSpeedButton;
    hora78: TLMDSpeedButton;
    hora79: TLMDSpeedButton;
    hora710: TLMDSpeedButton;
    hora711: TLMDSpeedButton;
    hora712: TLMDSpeedButton;
    hora713: TLMDSpeedButton;
    LMDLabel5: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    hora623: TLMDSpeedButton;
    hora622: TLMDSpeedButton;
    hora621: TLMDSpeedButton;
    hora620: TLMDSpeedButton;
    hora619: TLMDSpeedButton;
    hora618: TLMDSpeedButton;
    hora617: TLMDSpeedButton;
    hora616: TLMDSpeedButton;
    hora615: TLMDSpeedButton;
    hora614: TLMDSpeedButton;
    hora60: TLMDSpeedButton;
    hora61: TLMDSpeedButton;
    hora62: TLMDSpeedButton;
    hora63: TLMDSpeedButton;
    hora64: TLMDSpeedButton;
    hora65: TLMDSpeedButton;
    hora66: TLMDSpeedButton;
    hora67: TLMDSpeedButton;
    hora68: TLMDSpeedButton;
    hora69: TLMDSpeedButton;
    hora610: TLMDSpeedButton;
    hora611: TLMDSpeedButton;
    hora612: TLMDSpeedButton;
    hora613: TLMDSpeedButton;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    hora523: TLMDSpeedButton;
    hora522: TLMDSpeedButton;
    hora521: TLMDSpeedButton;
    hora520: TLMDSpeedButton;
    hora519: TLMDSpeedButton;
    hora518: TLMDSpeedButton;
    hora517: TLMDSpeedButton;
    hora516: TLMDSpeedButton;
    hora515: TLMDSpeedButton;
    hora514: TLMDSpeedButton;
    hora50: TLMDSpeedButton;
    hora51: TLMDSpeedButton;
    hora52: TLMDSpeedButton;
    hora53: TLMDSpeedButton;
    hora54: TLMDSpeedButton;
    hora55: TLMDSpeedButton;
    hora56: TLMDSpeedButton;
    hora57: TLMDSpeedButton;
    hora58: TLMDSpeedButton;
    hora59: TLMDSpeedButton;
    hora510: TLMDSpeedButton;
    hora511: TLMDSpeedButton;
    hora512: TLMDSpeedButton;
    hora513: TLMDSpeedButton;
    LMDLabel2: TLMDLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    hora423: TLMDSpeedButton;
    hora422: TLMDSpeedButton;
    hora421: TLMDSpeedButton;
    hora420: TLMDSpeedButton;
    hora419: TLMDSpeedButton;
    hora418: TLMDSpeedButton;
    hora417: TLMDSpeedButton;
    hora416: TLMDSpeedButton;
    hora415: TLMDSpeedButton;
    hora414: TLMDSpeedButton;
    hora40: TLMDSpeedButton;
    hora41: TLMDSpeedButton;
    hora42: TLMDSpeedButton;
    hora43: TLMDSpeedButton;
    hora44: TLMDSpeedButton;
    hora45: TLMDSpeedButton;
    hora46: TLMDSpeedButton;
    hora47: TLMDSpeedButton;
    hora48: TLMDSpeedButton;
    hora49: TLMDSpeedButton;
    hora410: TLMDSpeedButton;
    hora411: TLMDSpeedButton;
    hora412: TLMDSpeedButton;
    hora413: TLMDSpeedButton;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    hora323: TLMDSpeedButton;
    hora322: TLMDSpeedButton;
    hora321: TLMDSpeedButton;
    hora320: TLMDSpeedButton;
    hora319: TLMDSpeedButton;
    hora318: TLMDSpeedButton;
    hora317: TLMDSpeedButton;
    hora316: TLMDSpeedButton;
    hora315: TLMDSpeedButton;
    hora314: TLMDSpeedButton;
    hora30: TLMDSpeedButton;
    hora31: TLMDSpeedButton;
    hora32: TLMDSpeedButton;
    hora33: TLMDSpeedButton;
    hora34: TLMDSpeedButton;
    hora35: TLMDSpeedButton;
    hora36: TLMDSpeedButton;
    hora37: TLMDSpeedButton;
    hora38: TLMDSpeedButton;
    hora39: TLMDSpeedButton;
    hora310: TLMDSpeedButton;
    hora311: TLMDSpeedButton;
    hora312: TLMDSpeedButton;
    hora313: TLMDSpeedButton;
    LMDLabel4: TLMDLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    hora223: TLMDSpeedButton;
    hora222: TLMDSpeedButton;
    hora221: TLMDSpeedButton;
    hora220: TLMDSpeedButton;
    hora219: TLMDSpeedButton;
    hora218: TLMDSpeedButton;
    hora217: TLMDSpeedButton;
    hora216: TLMDSpeedButton;
    hora215: TLMDSpeedButton;
    hora214: TLMDSpeedButton;
    hora20: TLMDSpeedButton;
    hora21: TLMDSpeedButton;
    hora22: TLMDSpeedButton;
    hora23: TLMDSpeedButton;
    hora24: TLMDSpeedButton;
    hora25: TLMDSpeedButton;
    hora26: TLMDSpeedButton;
    hora27: TLMDSpeedButton;
    hora28: TLMDSpeedButton;
    hora29: TLMDSpeedButton;
    hora210: TLMDSpeedButton;
    hora211: TLMDSpeedButton;
    hora212: TLMDSpeedButton;
    hora213: TLMDSpeedButton;
    LMDLabel6: TLMDLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    hora123: TLMDSpeedButton;
    hora122: TLMDSpeedButton;
    hora121: TLMDSpeedButton;
    hora120: TLMDSpeedButton;
    hora119: TLMDSpeedButton;
    hora118: TLMDSpeedButton;
    hora117: TLMDSpeedButton;
    hora116: TLMDSpeedButton;
    hora115: TLMDSpeedButton;
    hora114: TLMDSpeedButton;
    hora10: TLMDSpeedButton;
    hora11: TLMDSpeedButton;
    hora12: TLMDSpeedButton;
    hora13: TLMDSpeedButton;
    hora14: TLMDSpeedButton;
    hora15: TLMDSpeedButton;
    hora16: TLMDSpeedButton;
    hora17: TLMDSpeedButton;
    hora18: TLMDSpeedButton;
    hora19: TLMDSpeedButton;
    hora110: TLMDSpeedButton;
    hora111: TLMDSpeedButton;
    hora112: TLMDSpeedButton;
    hora113: TLMDSpeedButton;
    LMDLabel7: TLMDLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    btnNenhum: TLMDSpeedButton;
    btnTodos: TLMDSpeedButton;
    LMDSimplePanel15: TLMDSimplePanel;
    cxTabSheet1: TcxTabSheet;
    cmNome: TdxBarEdit;
    cmCancelar: TdxBarLargeButton;
    lbValor: TLabel;
    edValor: TcxCurrencyEdit;
    rbTipoCredTempo: TcxRadioButton;
    cxGroupBox1: TcxGroupBox;
    edMinutos: TcxCurrencyEdit;
    rbTipoCredValor: TcxRadioButton;
    cxGroupBox2: TcxGroupBox;
    Image1: TImage;
    edValorCred: TcxCurrencyEdit;
    Image2: TImage;
    Label4: TLabel;
    cxLabel2: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image4: TImage;
    rbHPSim: TcxRadioButton;
    cxLabel1: TcxLabel;
    rbHPNao: TcxRadioButton;
    LMDSimplePanel10: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    Image3: TImage;
    cxLabel4: TcxLabel;
    lbExpirar: TLabel;
    edExpirar: TcxMaskEdit;
    LMDSimplePanel11: TLMDSimplePanel;
    rgExpirar: TcxRadioGroup;
    cbPodeProd: TcxCheckBox;
    edTipoAcesso: TcxComboBox;
    Label3: TLabel;
    procedure hora16MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure hora10Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoExpChange(Sender: TObject);
    procedure tHistCalcFields(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure cmForcaExpirarClick(Sender: TObject);
    procedure edHorasPropertiesEditValueChanged(Sender: TObject);
    procedure edMinutosPropertiesEditValueChanged(Sender: TObject);
  private
    FNovo : Boolean;
    FResultado : Boolean;
    FPassaporte : PPassaporte;
    { Private declarations }
    procedure LeCores;
    procedure SalvaCores;
    procedure AjustaTipoExp;
  public
    { Public declarations }
    function Editar(aNovo: Boolean; aPassaporte: PPassaporte): Boolean;
  end;

var
  FrmPassaporte: TFrmPassaporte;

implementation

uses ucmaDM, cmIDRecursos, ucmaFrmAcesso, ucmaPri, ufmImagens;

{$R *.DFM}

procedure TFrmPassaporte.hora16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then 
    TLMDSpeedButton(Sender).Color := clGreen
  else
  if ssAlt in Shift then 
    TLMDSpeedButton(Sender).Color := clRed;
end;

function TFrmPassaporte.Editar(aNovo: Boolean; aPassaporte: PPassaporte): Boolean;
begin
  FResultado := False;
  FNovo := aNovo;
  FPassaporte := aPassaporte;
  if FNovo then FillChar(FPassaporte^, SizeOf(TPassaporte), 0);
  LeCores;
  cbTipoExp.ItemIndex := FPassaporte^.pcTipoExp;
  if FNovo then
    edTipoAcesso.EditValue := -1    
  else
    edTipoAcesso.EditValue := FPassaporte^.pcTipoAcesso; 

  edNome.Text := FPassaporte^.pcNome;
  edValor.Value := FPassaporte^.pcValor;

  edHoras.Value := FPassaporte^.pcMaxSegundos / 60 / 60;
  edMinutos.Value := FPassaporte^.pcMaxSegundos / 60;
  AjustaTipoExp;
  with FPassaporte^ do
  case pcTipoExp of
    teDias,
    teAcessos,
    teHoras : edExpirar.EditValue := Trunc(pcExpirarEm);
    teDataMarcada : edExpirar.EditValue := pcExpirarEm;
  end;

  tsHist.TabVisible := (FPassaporte^.pcNumero>0);
  if (not tsHist.TabVisible) or FPassaporte^.pcExpirou then
    cmForcaExpirar.Visible := ivNever;
  with FPassaporte^ do
  if tsHist.TabVisible then begin
    tsRegras.Enabled := False;
    tHist.SetRange([pcNumero], [pcNumero]);
    if pcAcessos>0 then
      edPrimUso.EditValue := FormatDateTime('dd/mm/yyyy hh:mm', pcPrimeiroUso)
    else
      edPrimUso.EditValue := 'Sem Uso';
      
    edAcessos.EditValue := pcAcessos;
    lbValor.Visible := False;
    edValor.Visible := False;
  end;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmPassaporte.LeCores;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if FPassaporte^.HoraValida[Dia, H] then
      SB.Color := clGreen
    else
      SB.Color := clRed;
      
    SB.Font.Color := clWhite;  
  end;
end;

procedure TFrmPassaporte.SalvaCores;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    FPassaporte^.HoraValida[Dia, H] := (SB.Color=clGreen);
  end;
end;

procedure TFrmPassaporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPassaporte.hora10Click(Sender: TObject);
begin
  with TLMDSpeedButton(Sender) do
  if Color=clGreen then
    Color := clRed
  else
    Color := clGreen;
end;

procedure TFrmPassaporte.btnTodosClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clGreen;
  end;
end;

procedure TFrmPassaporte.btnNenhumClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clRed;
  end;
end;

procedure TFrmPassaporte.cmGravarClick(Sender: TObject);
begin
  SalvaCores;
  FResultado := True;
  with FPassaporte^ do begin
    pcNome := edNome.Text;
    pcValor := edValor.Value;
    pcMaxSegundos := Trunc(edMinutos.Value * 60);
    pcTipoAcesso := edTipoAcesso.EditValue;
    pcTipoExp := cbTipoExp.ItemIndex;
    case pcTipoExp of
      teDias,
      teAcessos,
      teHoras : pcExpirarEm := edExpirar.EditValue;
      teDataMarcada : pcExpirarEm := edExpirar.EditValue;
    else
      pcExpirarEm := 0;
    end;
  end;
  Close;
end;

procedure TFrmPassaporte.FormCreate(Sender: TObject);
var II : TcxImageComboBoxItem;
begin
  Paginas.ActivePageIndex := 0;
  tHist.Open;
  with Dados, edTipoAcesso.Properties do begin
    Items.Clear;
    II := TcxImageComboBoxItem(Items.Add);
    II.Value := -1;
    II.Description := 'Todos';

    if tbTipoAcesso.RecordCount<2 then begin
      lbTipoAcesso.Visible := False;
      edTipoAcesso.Visible := False;
    end;

    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do begin
      II := TcxImageComboBoxItem(Items.Add);
      II.Description := tbTipoAcessoNome.Value;
      II.Value := tbTipoAcessoCodigo.Value;
      tbTipoAcesso.Next;
    end;
  end;
end;

procedure TFrmPassaporte.AjustaTipoExp;
begin
  lbExpirar.Visible := (cbTipoExp.ItemIndex<>teNunca);
  edExpirar.Visible := lbExpirar.Visible;
  case cbTipoExp.ItemIndex of
    teDias : begin
      lbExpirar.Caption := 'Expirar em (Dias)';
      edExpirar.Properties.EditMask := '999';
      edExpirar.EditValue := 1;
    end;
    teHoras : begin
      lbExpirar.Caption := 'Expirar em (Horas)';
      edExpirar.Properties.EditMask := '9999';
      edExpirar.EditValue := 1;
    end;
    teAcessos : begin
      lbExpirar.Caption := 'Expirar em (Acessos)';
      edExpirar.Properties.EditMask := '99999';
      edExpirar.EditValue := 1;
    end;
    teDataMarcada : begin
      lbExpirar.Caption := 'Expirar em (Data)';
      edExpirar.Properties.EditMask := '!99/99/0000;1; ';
      edExpirar.EditValue := Date;
    end;
  end;
end;

procedure TFrmPassaporte.cbTipoExpChange(Sender: TObject);
begin
  AjustaTipoExp;
end;

procedure TFrmPassaporte.tHistCalcFields(DataSet: TDataSet);
begin
  tHistUsadoM.Value := (tHistSegundos.Value / 60);
  tHistUsadoH.Value := tHistUsadoM.Value / 60;
end;

procedure TFrmPassaporte.GridDblClick(Sender: TObject);
begin
  if Dados.tbAcesso.Locate('Numero', tHistTransacao.Value, []) then
    TFrmAcesso.Create(nil).Editar(Dados.tbAcesso, 0);
end;

procedure TFrmPassaporte.cmForcaExpirarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente forçar a expiração desse passaporte?', mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then 
    FPassaporte^.pcExpirou := True;
end;

procedure TFrmPassaporte.edHorasPropertiesEditValueChanged(
  Sender: TObject);
begin
  if not edHoras.Focused then Exit;
  try
    edMinutos.Value := edHoras.EditValue  * 60;
  except
    edMinutos.Value := 0;
  end;
end;

procedure TFrmPassaporte.edMinutosPropertiesEditValueChanged(
  Sender: TObject);
begin
  if not edMinutos.Focused then Exit;
  try
    edHoras.Value := edMinutos.EditValue / 60;
  except
    edHoras.Value := 0;
  end;
end;

end.

Tipo Crédito
Tempo 
Valor

Nome do Crédito: 

Espécie de Crédito: 
1. Tempo
2. Valor


