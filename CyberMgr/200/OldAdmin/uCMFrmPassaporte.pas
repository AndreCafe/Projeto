unit uCMFrmPassaporte;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  LMDCustomComponent, LMDApplicationCtrl, dxBar, Db, kbmMemTable, dxDBTLCl,
  dxGrClms, dxInspct, dxDBInsp, dxInspRw, dxDBInRw, nxdb, dxBarExtItems,
  dxPageControl, dxExEdtr, dxEdLib, dxDBELib, dxEditor, StdCtrls, ovcbase,
  ovcef, ovcpb, ovcpf, cmClassesBase, ovcnf, LMDButtonControl,
  LMDRadioButton;

type
  TFrmPassaporte = class(TForm)
    BarMgr: TdxBarManager;
    dxBarDockControl2: TdxBarDockControl;
    cmCancelar: TdxBarLargeButton;
    cmGravar: TdxBarLargeButton;
    stNome: TdxBarStatic;
    LMDSimplePanel1: TLMDSimplePanel;
    Paginas: TdxPageControl;
    tsRegras: TdxTabSheet;
    tsHist: TdxTabSheet;
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
    Dia: TLMDLabel;
    LMDLabel11: TLMDLabel;
    btnNenhum: TLMDSpeedButton;
    btnTodos: TLMDSpeedButton;
    LMDSimplePanel10: TLMDSimplePanel;
    LMDSimplePanel11: TLMDSimplePanel;
    Label1: TLabel;
    cbTipoExp: TComboBox;
    lbExpirar: TLabel;
    edExpirar: TOvcPictureField;
    Label3: TLabel;
    Label4: TLabel;
    cmNomePass: TdxBarControlContainerItem;
    lbTipoAcesso: TLabel;
    LMDSimplePanel12: TLMDSimplePanel;
    Label6: TLabel;
    edPrimUso: TOvcPictureField;
    Label7: TLabel;
    edAcessos: TOvcNumericField;
    LMDSimplePanel14: TLMDSimplePanel;
    Grid: TdxDBGrid;
    tHist: TnxTable;
    tHistTransacao: TIntegerField;
    tHistDataHora: TDateTimeField;
    Label9: TLabel;
    DataSource1: TDataSource;
    dsHist: TDataSource;
    tHistUsadoM: TFloatField;
    tHistUsadoH: TFloatField;
    GridDataHora: TdxDBGridDateColumn;
    GridUsadoM: TdxDBGridColumn;
    GridUsadoH: TdxDBGridColumn;
    edHoras: TdxCurrencyEdit;
    edMinutos: TdxCurrencyEdit;
    rbValido: TLMDRadioButton;
    rbInvalido: TLMDRadioButton;
    edNome: TEdit;
    edTipoAcesso: TdxImageEdit;
    lbValor: TLabel;
    edValor: TdxCurrencyEdit;
    tHistPassaporte: TIntegerField;
    tHistSegundos: TIntegerField;
    tHistNumSeq: TAutoIncField;
    procedure hora16MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure hora10Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoExpChange(Sender: TObject);
    procedure edHorasChange(Sender: TObject);
    procedure edMinutosChange(Sender: TObject);
    procedure tHistCalcFields(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
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

uses uCMDados, uCMFrmCorPreco, cmIDRecursos, uCMFrmAcesso;

{$R *.DFM}

procedure TFrmPassaporte.hora16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then 
  with TLMDSpeedButton(Sender) do begin
    if rbValido.Checked then
      Color := clGreen
    else
      Color := clRed;
  end;  
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
    edTipoAcesso.Text := '-1' 
  else
    edTipoAcesso.Text := IntToStr(FPassaporte^.pcTipoAcesso);

  if edTipoAcesso.ImageIndexes.IndexOf(IntToStr(FPassaporte^.pcTipoAcesso))=-1 then
    edTipoAcesso.Text := '-1';

  edNome.Text := FPassaporte^.pcNome;
  edValor.Value := FPassaporte^.pcValor;

  edHoras.Value := FPassaporte^.pcMaxSegundos / 60 / 60;
  edMinutos.Value := FPassaporte^.pcMaxSegundos / 60;
  AjustaTipoExp;
  with FPassaporte^ do
  case pcTipoExp of
    teDias,
    teAcessos,
    teHoras : edExpirar.AsInteger := Trunc(pcExpirarEm);
    teDataMarcada : edExpirar.AsDateTime := pcExpirarEm;
  end;

  tsHist.TabVisible := (FPassaporte^.pcNumero>0);
  with FPassaporte^ do
  if tsHist.TabVisible then begin
    tsRegras.Enabled := False;
    tHist.SetRange([pcNumero], [pcNumero]);
    if pcAcessos>0 then
      edPrimUso.AsString := FormatDateTime('dd/mm/yyyy hh:mm', pcPrimeiroUso)
    else
      edPrimUso.AsString := 'Sem Uso';
      
    edAcessos.AsInteger := pcAcessos;
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

procedure TFrmPassaporte.cmCancelarClick(Sender: TObject);
begin
  Close;
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
var I : Integer;
begin
  SalvaCores;
  FResultado := True;
  with FPassaporte^ do begin
    pcNome := edNome.Text;
    pcValor := edValor.Value;
    pcMaxSegundos := Trunc(edMinutos.Value * 60);
    pcTipoAcesso := StrToIntDef(edTipoAcesso.Text, -1);
    pcTipoExp := cbTipoExp.ItemIndex;
    case pcTipoExp of
      teDias,
      teAcessos,
      teHoras : pcExpirarEm := edExpirar.AsInteger;
      teDataMarcada : pcExpirarEm := edExpirar.AsDateTime;
    else
      pcExpirarEm := 0;
    end;
  end;
  Close;
end;

procedure TFrmPassaporte.FormCreate(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
  tHist.Open;
  edTipoAcesso.Values.Clear;
  edTipoAcesso.ImageIndexes.Clear;
  edTipoAcesso.Descriptions.Clear;
  edTipoAcesso.Values.Add('-1');
  edTipoAcesso.ImageIndexes.Add('-1');
  edTipoAcesso.Descriptions.Add('Todos');

  with Dados do begin
    if tbTipoAcesso.RecordCount<2 then begin
      lbTipoAcesso.Visible := False;
      edTipoAcesso.Visible := False;
    end;

    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do begin
      edTipoAcesso.Values.Add(tbTipoAcessoCodigo.AsString);
      edTipoAcesso.ImageIndexes.Add(tbTipoAcessoCodigo.AsString);
      edTipoAcesso.Descriptions.Add(tbTipoAcessoNome.Value);
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
      edExpirar.DataType := pftLongint;
      lbExpirar.Caption := 'Expirar em (Dias)';
      edExpirar.AsInteger := 1;
    end;
    teHoras : begin
      edExpirar.DataType := pftLongint;
      lbExpirar.Caption := 'Expirar em (Horas)';
      edExpirar.AsInteger := 1;
    end;
    teAcessos : begin
      edExpirar.DataType := pftLongint;
      lbExpirar.Caption := 'Expirar em (Acessos)';
      edExpirar.AsInteger := 1;
    end;
    teDataMarcada : begin
      edExpirar.DataType := pftDate;
      lbExpirar.Caption := 'Expirar em (Data)';
      edExpirar.InitDateTime := True;
      edExpirar.AsDateTime := Now;
    end;
  end;
end;

procedure TFrmPassaporte.cbTipoExpChange(Sender: TObject);
begin
  AjustaTipoExp;
end;

procedure TFrmPassaporte.edHorasChange(Sender: TObject);
begin
  if not edHoras.Focused then Exit;
  try
    edMinutos.Value := StrToFloat(edHoras.EditText) * 60;
  except
    edMinutos.Value := 0;
  end;
end;

procedure TFrmPassaporte.edMinutosChange(Sender: TObject);
begin
  if not edMinutos.Focused then Exit;
  try
    edHoras.Value := StrToFloat(edMinutos.EditText) / 60;
  except
    edHoras.Value := 0;
  end;
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

end.
