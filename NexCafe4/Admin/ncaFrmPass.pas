unit ncaFrmPass;

interface

uses
  Windows, ncErros, ncPassaportes, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, ExtCtrls,
  LMDCustomComponent, LMDApplicationCtrl, dxBar, Db, kbmMemTable, 
  nxdb, dxBarExtItems,   StdCtrls, 
  ncClassesBase, LMDButtonControl,
  LMDRadioButton, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCalendar, cxMaskEdit, cxDropDownEdit,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGridLevel, cxGrid,
  cxImageComboBox, cxDBLookupComboBox, cxLabel, LMDCustomParentPanel,
  LMDCustomGroupBox, LMDCustomButtonGroup, LMDCustomRadioGroup,
  LMDRadioGroup, pngimage, cxGroupBox, cxRadioGroup, cxCheckBox, Buttons,
  PngSpeedButton, cxSpinEdit, cxDBEdit, 
  LMDPNGImage, cxGridDBTableView, cxLookAndFeelPainters, Menus, cxButtons;

type
  TFrmPassaporte = class(TForm)
    BarMgr: TdxBarManager;
    dxBarDockControl2: TdxBarDockControl;
    cmGravar: TdxBarLargeButton;
    tHist: TnxTable;
    tHistDataHora: TDateTimeField;
    DataSource1: TDataSource;
    dsHist: TDataSource;
    tHistPassaporte: TIntegerField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cmCancelar: TdxBarLargeButton;
    Paginas: TcxPageControl;
    tsHorarios: TcxTabSheet;
    panHorarios: TLMDSimplePanel;
    panDiasHoras: TLMDSimplePanel;
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
    tsHist: TcxTabSheet;
    Label9: TLabel;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarStatic1: TdxBarStatic;
    tHistID: TAutoIncField;
    tHistSessao: TIntegerField;
    tHistCancelado: TBooleanField;
    tHistMinutosAnt: TFloatField;
    tHistMinutosUsados: TFloatField;
    tHistExpirou: TBooleanField;
    cmNome: TcxTextEdit;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel2: TcxLabel;
    TV: TcxGridDBTableView;
    TVDataHora: TcxGridDBColumn;
    TVUsadoM: TcxGridDBColumn;
    TVEm: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    edValor: TcxCurrencyEdit;
    edHoras: TcxMaskEdit;
    Label4: TLabel;
    edMinutos: TcxSpinEdit;
    Label2: TLabel;
    lbValor: TLabel;
    cxGroupBox2: TcxGroupBox;
    edTipoAcesso: TcxComboBox;
    lbTipoAcesso: TLabel;
    gbFid: TcxGroupBox;
    edFidPontos: TcxSpinEdit;
    lbFidPontos: TcxLabel;
    rbFidNao: TcxRadioButton;
    rbFidSim: TcxRadioButton;
    tsRegras: TcxTabSheet;
    panExp: TLMDSimplePanel;
    rbExpNunca: TcxRadioButton;
    rbExpDias: TcxRadioButton;
    edExpDias: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    edExpHoras: TcxSpinEdit;
    rbExpHoras: TcxRadioButton;
    cxLabel10: TcxLabel;
    edExpAcessos: TcxSpinEdit;
    rbExpAcessos: TcxRadioButton;
    rbExpData: TcxRadioButton;
    edExpData: TcxDateEdit;
    edExp: TcxPopupEdit;
    cxLabel3: TcxLabel;
    Image2: TImage;
    btnCancelarExp: TcxButton;
    btnOkExp: TcxButton;
    procedure hora16MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure hora10Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoExpChange(Sender: TObject);
    procedure edHorasPropertiesEditValueChanged(Sender: TObject);
    procedure edMinutosPropertiesEditValueChanged(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure TVUsadoMGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure rbFidSimClick(Sender: TObject);
    procedure TVUsadoMCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVEmGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVDblClick(Sender: TObject);
    procedure rbExpDiasClick(Sender: TObject);
    procedure rbExpHorasClick(Sender: TObject);
    procedure rbExpAcessosClick(Sender: TObject);
    procedure rbExpDataClick(Sender: TObject);
    procedure rbExpNuncaClick(Sender: TObject);
    procedure btnOkExpClick(Sender: TObject);
    procedure btnCancelarExpClick(Sender: TObject);
    procedure edExpPropertiesInitPopup(Sender: TObject);
  private
    FNovo : Boolean;
    FResultado : Boolean;
    FPassaporte : TncPassaporte;
    FExpEm : Integer;
    { Private declarations }
    procedure LeCores;
    procedure SalvaCores;
    procedure AjustaTipoExp;

    procedure AjustaVisFid;
  public
    { Public declarations }
    function Editar(aNovo: Boolean; aPassaporte: TncPassaporte): Boolean;
  end;

var
  FrmPassaporte: TFrmPassaporte;

implementation

uses 
  ncaDM, 
  ncIDRecursos, 
  ncaFrmPri, 
  ufmImagens, ncDMServ, ncTarifador, ncSessao, ncafbTran, ncVersoes;

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

function TFrmPassaporte.Editar(aNovo: Boolean; aPassaporte: TncPassaporte): Boolean;
begin
  FResultado := False;
  FNovo := aNovo;
  FPassaporte := aPassaporte;
  if FNovo then FPassaporte.Limpa;
  LeCores;
  edExp.Tag := FPassaporte.pcTipoExp;
  FExpEm := Trunc(FPassaporte.pcExpirarEm);
  
  with edTipoAcesso do 
  if FNovo then
    ItemIndex := 0
  else
    ItemIndex := Properties.Items.IndexOfObject(TObject(FPassaporte.pcTipoAcesso));

  cmNome.Text := FPassaporte.pcNome;
  edValor.Value := FPassaporte.pcValor;

  if FPassaporte.pcFidelidade then
    rbFidSim.Checked := True else
    rbFidNao.Checked := True;

  edFidPontos.Value := FPassaporte.pcFidPontos;  

  AjustaVisFid;

  edHoras.EditValue := FPassaporte.pcMaxSegundos / 60 / 60;
  edMinutos.EditValue := FPassaporte.pcMaxSegundos / 60;
  AjustaTipoExp;

  tsHist.TabVisible := (FPassaporte.pcID>0);
    
  with FPassaporte do
  if tsHist.TabVisible then begin
    panDiasHoras.Enabled := False;
    tHist.SetRange([pcID], [pcID]);
    lbValor.Visible := False;
    edValor.Visible := False;
    cmGravar.Enabled := False;
  end else
    cmGravar.Enabled := Permitido(daCFGPrecos);
  if FNovo then btnTodosClick(nil);
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
    if FPassaporte.HoraValida[Dia, H] then
      SB.Color := clGreen
    else
      SB.Color := clRed;
      
    SB.Font.Color := clWhite;  
  end;
end;

procedure TFrmPassaporte.rbExpAcessosClick(Sender: TObject);
begin
  edExpDias.Enabled := False;
  edExpHoras.Enabled := False;
  edExpData.Enabled := False;
  edExpAcessos.Enabled := True;
end;

procedure TFrmPassaporte.rbExpDataClick(Sender: TObject);
begin
  edExpDias.Enabled := False;
  edExpHoras.Enabled := False;
  edExpData.Enabled := True;
  edExpAcessos.Enabled := False;
end;

procedure TFrmPassaporte.rbExpDiasClick(Sender: TObject);
begin
  edExpDias.Enabled := True;
  edExpHoras.Enabled := False;
  edExpData.Enabled := False;
  edExpAcessos.Enabled := False;
end;

procedure TFrmPassaporte.rbExpHorasClick(Sender: TObject);
begin
  edExpDias.Enabled := False;
  edExpHoras.Enabled := True;
  edExpData.Enabled := False;
  edExpAcessos.Enabled := False;
end;

procedure TFrmPassaporte.rbFidSimClick(Sender: TObject);
begin
  AjustaVisFid;
end;

procedure TFrmPassaporte.SalvaCores;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    FPassaporte.HoraValida[Dia, H] := (SB.Color=clGreen);
  end;
end;

procedure TFrmPassaporte.TVDblClick(Sender: TObject);
begin
  Dados.LoadEditSessao(tHistSessao.Value);
end;

procedure TFrmPassaporte.TVEmGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := 'em';
end;

procedure TFrmPassaporte.TVUsadoMCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TFrmPassaporte.TVUsadoMGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVUsadoM.Index];
  if V<>null then
    AText := MinutosToHoraStr(V);
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

procedure TFrmPassaporte.AjustaVisFid;
begin
  gbFid.Enabled := gConfig.FidAtivo;
  rbFidSim.Enabled := gbFid.Enabled;
  rbFidNao.Enabled := gbFid.Enabled;
  lbFidPontos.Enabled := gbFid.Enabled and rbFidSim.Checked;
  edFidPontos.Enabled := lbFidPontos.Enabled;
end;

procedure TFrmPassaporte.btnCancelarExpClick(Sender: TObject);
begin
  edExp.DroppedDown := False;
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

procedure TFrmPassaporte.btnOkExpClick(Sender: TObject);
begin
  if rbExpNunca.Checked then begin
    edExp.Tag := teNunca;
    edExp.Text := 'Não Expira';
    FExpEm := 0;
  end else
  if rbExpDias.Checked then begin
    if (edExpDias.Value=null) or (edExpDias.Value<1) then
      Raise ENexCafe.Create('É necessário informar a quantidade de dias');
      
    edExp.Tag := teDias;
    edExp.Text := 'Expira em ' + IntToStr(edExpDias.Value) + ' dia(s)';
    FExpEm := edExpDias.Value;
  end else
  if rbExpHoras.Checked then begin
    if (edExpHoras.Value=null) or (edExpHoras.Value<1) then
      Raise ENexCafe.Create('É necessário informar a quantidade de horas');
      
    edExp.Tag := teHoras;
    edExp.Text := 'Expira em ' + IntToStr(edExpHoras.Value) + ' hora(s)';
    FExpEm := edExpHoras.Value;
  end else
  if rbExpAcessos.Checked then begin
    if (edExpAcessos.Value=null) or (edExpAcessos.Value<1) then
      Raise ENexCafe.Create('É necessário informar a quantidade de acessos');
      
    edExp.Tag := teAcessos;
    edExp.Text := 'Expira em ' + IntToStr(edExpAcessos.Value) + ' acesso(s)';
    FExpEm := edExpAcessos.Value;
  end else 
  if rbExpData.Checked then begin
    if (edExpData.EditValue=null) then 
      Raise ENexCafe.Create('É necessário informar a data limite para utilização desse crédito');
      
    edExp.Tag := teDataMarcada;
    edExp.Text := 'Expira em ' + FormatDateTime('dd/mm/yyyy', edExpData.Date);
    FExpEm := Trunc(edExpData.Date);
  end;
  edExp.DroppedDown := False;
end;

procedure TFrmPassaporte.cmGravarClick(Sender: TObject);
begin
  SalvaCores;
  edFidPontos.PostEditValue;
  FResultado := True;
  with FPassaporte do begin
    pcNome := cmNome.Text;
    pcFidelidade := rbFidSim.Checked;
    pcFidPontos := edFidPontos.Value;
    pcValor := edValor.Value;
    pcMaxSegundos := Trunc(edMinutos.Value * 60);
    if pcMaxSegundos<60 then
      Raise ENexCafe.Create('Tempo não pode ser zero');
    if Trim(pcNome)='' then
      Raise ENexCafe.Create('É obrigatório dar um nome para esse crédito'); 
    pcTipoAcesso := Integer(edTipoAcesso.Properties.Items.Objects[edTipoAcesso.ItemIndex]);
    pcTipoExp := edExp.Tag;
    pcExpirarEm := FExpEm;
  end;
  Close;
end;

procedure TFrmPassaporte.rbExpNuncaClick(Sender: TObject);
begin
  edExpDias.Enabled := False;
  edExpHoras.Enabled := False;
  edExpData.Enabled := False;
  edExpAcessos.Enabled := False;
end;

procedure TFrmPassaporte.FormCreate(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
  tsRegras.TabVisible := False;
  tHist.Open;
  with Dados, edTipoAcesso.Properties do begin
    Items.Clear;
    Items.AddObject('Todos', TObject(-1));

    if tbTipoAcesso.RecordCount<2 then begin
      lbTipoAcesso.Visible := False;
      edTipoAcesso.Visible := False;
    end;

    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do begin
      Items.AddObject(tbTipoAcessoNome.Value, TObject(tbTipoAcessoID.Value));
      tbTipoAcesso.Next;
    end;
  end;
end;

procedure TFrmPassaporte.AjustaTipoExp;
begin
  edExpDias.Enabled := (edExp.Tag=teDias);
  edExpHoras.Enabled := (edExp.Tag=teHoras);
  edExpAcessos.Enabled := (edExp.Tag=teAcessos);
  edExpData.Enabled := (edExp.Tag=teDataMarcada);
  case edExp.Tag of
    teDias : begin
      rbExpDias.Checked := True;
      edExpDias.Value := FExpEm;
      edExp.Text := 'Expira em ' + IntToStr(FExpEm) + ' dia(s)';
    end;
    
    teHoras : begin
      rbExpHoras.Checked := True;
      edExpHoras.Value := FExpEm;
      edExp.Text := 'Expira em ' + IntToStr(FExpEm) + ' hora(s)';
    end;
    
    teAcessos : begin
      rbExpAcessos.Checked := True;
      edExpAcessos.Value := FExpEm;
      edExp.Text := 'Expira em ' + IntToStr(FExpEm) + ' acesso(s)';
    end;
    
    teDataMarcada : begin
      rbExpData.Checked := True;
      edExpData.Date := FExpEm;
      edExp.Text := 'Expira em ' + FormatDateTime('dd/mm/yyyy', FExpEm);
    end;

    teNunca : begin
      rbExpNunca.Checked := True;
      edExp.Text := 'Não Expira';
    end;
  end;
end;

procedure TFrmPassaporte.cbTipoExpChange(Sender: TObject);
begin
  AjustaTipoExp;
end;

procedure TFrmPassaporte.edExpPropertiesInitPopup(Sender: TObject);
begin
  AjustaTipoExp;
end;

procedure TFrmPassaporte.edHorasPropertiesEditValueChanged(
  Sender: TObject);
begin
  if not edHoras.Focused then Exit;
  try
    edHoras.PostEditValue;
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
    edMinutos.PostEditValue;
    edHoras.EditValue := edMinutos.EditValue / 60;
  except
    edHoras.EditValue := 0;
  end;
end;

procedure TFrmPassaporte.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

Tipo Crédito
Tempo 
Valor

Nome do Crédito: 

Espécie de Crédito: 
1. Tempo
2. Valor


