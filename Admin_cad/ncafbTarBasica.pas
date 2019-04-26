unit ncafbTarBasica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxButtonEdit, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid, nxdb,
  kbmMemTable, dxBar, LMDCustomSimpleLabel, LMDSimpleLabel,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxBarExtItems, ExtCtrls, cxCurrencyEdit, dxBarExtDBItems, Buttons,
  PngSpeedButton, cxTimeEdit, cxMaskEdit;

type
  TfbTarBasica = class(TFrmBase)
    panHoraCor: TLMDSimplePanel;
    panHorarios: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
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
    LMDSimplePanel5: TLMDSimplePanel;
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
    LMDSimplePanel6: TLMDSimplePanel;
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
    LMDSimplePanel8: TLMDSimplePanel;
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
    LMDSimplePanel9: TLMDSimplePanel;
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
    LMDSimplePanel10: TLMDSimplePanel;
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
    LMDSimplePanel11: TLMDSimplePanel;
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
    LMDSimplePanel12: TLMDSimplePanel;
    LMDSimplePanel14: TLMDSimplePanel;
    lbTarifas: TLMDSimpleLabel;
    btnMesmaTarifa: TLMDSpeedButton;
    mtCor: TkbmMemTable;
    mtCorTipoAcesso: TWordField;
    mtCorCor: TIntegerField;
    mtCorCorFonte: TIntegerField;
    mtCorDescricao: TStringField;
    mtCorReinicia: TBooleanField;
    mtCorEtapas: TStringField;
    dsCor: TDataSource;
    dsEtapas: TDataSource;
    mtEtapas: TkbmMemTable;
    mtEtapasTipoAcesso: TWordField;
    mtEtapasCor: TIntegerField;
    mtEtapasPos: TWordField;
    mtEtapasValor: TCurrencyField;
    mtEtapasTempo: TDateTimeField;
    mtEtapasValorMin: TCurrencyField;
    mtEtapasTolerancia: TDateTimeField;
    tAux: TnxTable;
    tAuxNome: TStringField;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    TV: TcxGridDBBandedTableView;
    TVCor: TcxGridDBBandedColumn;
    TVDescricao: TcxGridDBBandedColumn;
    TVEtapas: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel15: TLMDSimplePanel;
    LMDSimplePanel16: TLMDSimplePanel;
    btnCriaNovaTarifa: TPngSpeedButton;
    btnEditarTarifa: TPngSpeedButton;
    btnApagarTarifa: TPngSpeedButton;
    cmTiposAcesso: TdxBarCombo;
    tAuxID: TWordField;
    procedure hora10Click(Sender: TObject);
    procedure hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TVCorCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVCorGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure TVEtapasGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmTiposAcessoChange(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure btnCriaNovaTarifaClick(Sender: TObject);
    procedure btnEditarTarifaClick(Sender: TObject);
    procedure btnApagarTarifaClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    FAlterou: Boolean;
    FLendo: Boolean;
    CorA : Integer;
    
    { Private declarations }
    function GetEtapasSt(Cor: Integer): String;
    procedure SetAlterou(const Value: Boolean);
    property Alterou: Boolean
      read FAlterou write SetAlterou;

    procedure LeHoraCor;
    procedure SalvaHoraCor;
    procedure LeCores;
    procedure SalvaCores;
    procedure LeEtapas;
    procedure SalvaEtapas;
    procedure MesmaTarifa;
    procedure AtualizaDireitos; override;
      
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure Ler;
    procedure Salvar;
    procedure RefreshTiposAcesso;
    function TipoAcesso: Integer;
    { Public declarations }
  end;

var
  fbTarBasica: TfbTarBasica;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncaFrmCorPreco, 
  ncIDRecursos;

{$R *.dfm}

{unction InverseColor( color: TColor ): TColor;
var
  rgb_: TColorref;
  
  Function Inv( b: Byte ): Byte;
  Begin
    if b > 128 Then
      result:= 0
    else
      result:= 255;
  End;
  
begin
  rgb_ := ColorToRgb( color );
  rgb_ := RGB( Inv(GetRValue( rgb_ )),
               Inv(GetGValue( rgb_ )),
               Inv(GetBValue( rgb_ )));
  Result := rgb_;
end;}

function InverseColor(BackGroundColor : TColor):TColor;
const
 cHalfBrightness = ((0.3 * 255.0) + (0.59 * 255.0) + (0.11 * 255.0)) / 2.0;
var
 Brightness : double;
begin
 with TRGBQuad(BackGroundColor) do
  BrightNess := (0.3 * rgbRed) + (0.59 * rgbGreen) + (0.11 * rgbBlue);
 if (Brightness>cHalfBrightNess) then
  result := clblack
 else
  result := clwhite;
end;

function TfbTarBasica.TipoAcesso: Integer;
begin
  with cmTiposAcesso do
  if ItemIndex>=0 then 
    Result := Integer(Items.Objects[ItemIndex])
  else
    Result := -1;  
end;

function TfbTarBasica.GetEtapasSt(Cor: Integer): String;
begin
  mtEtapas.CancelRange;
  mtEtapas.SetRange([TipoAcesso, Cor], [TipoAcesso, Cor]);
  Result := '';
  try
    while not mtEtapas.Eof do begin
      if Result > '' then Result := Result + ', ';
      Result := Result + FormatDateTime('hh:mm:ss', mtEtapasTempo.Value) + ' - ' + 
           FloatToStrF(mtEtapasValor.Value, ffCurrency, 0, 2);
      mtEtapas.Next;
    end;
  finally
    mtEtapas.CancelRange;
  end;
end;

procedure TfbTarBasica.hora10Click(Sender: TObject);
begin
  if mtCor.RecordCount=0 then Exit;
  with TLMDSpeedButton(Sender) do begin
    if Color <> mtCorCor.Value then
      Alterou := True;
    Color := mtCorCor.Value;
    Font.Color := InverseColor(Color);
  end;
end;

procedure TfbTarBasica.hora10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if mtCor.RecordCount=0 then Exit;
  if ssCtrl in Shift then 
  with TLMDSpeedButton(Sender) do begin
    if Color <> mtCorCor.Value then
      Alterou := True;
    Color := mtCorCor.Value;
    Font.Color := InverseColor(Color);
  end;  
end;

procedure TfbTarBasica.TVCorCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[TVCor.Index];
  if V=null then V := clSilver;
  ACanvas.Brush.Color := V;
end;

procedure TfbTarBasica.TVCorGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: String);
begin
  AText := '';
end;

procedure TfbTarBasica.TVEtapasGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var V: Variant;
begin
  V := ARecord.Values[TVCor.Index];
  if V <> null then 
    AText := GetEtapasSt(V);
end;

procedure TfbTarBasica.SetAlterou(const Value: Boolean);
begin
  FAlterou := Value;
  cmSalvar.Enabled := Value;
  cmCancelar.Enabled := Value;
  cmTiposAcesso.Enabled := not FAlterou;
end;

procedure TfbTarBasica.RefreshTiposAcesso;
var Ant: Integer;
begin
  FLendo := True;
  try
    Ant := TipoAcesso;
    tAux.Refresh;
    if tAux.IsEmpty then begin
      tAux.Insert;
      tAuxID.Value := 0;
      tAuxNome.Value := 'Internet e Jogos';
      tAux.Post;
    end;
    cmTiposAcesso.Items.Clear;
    tAux.First;
    while not tAux.Eof do begin
      cmTiposAcesso.Items.AddObject(tAuxNome.Value, TObject(tAuxID.Value));
      tAux.Next;
    end;
    if Ant<>-1 then begin
      Ant := cmTiposAcesso.Items.IndexOfObject(TObject(Ant));
      if Ant>=0 then cmTiposAcesso.ItemIndex := Ant;
    end;  
    if cmTiposAcesso.ItemIndex = -1 then 
      cmTiposAcesso.ItemIndex := 0;
    if cmTiposAcesso.Items.Count>1 then 
      cmTiposAcesso.Visible := ivAlways
    else
      cmTiposAcesso.Visible := ivNever;
  finally
    FLendo := False;
  end;    
end;

procedure TfbTarBasica.cmTiposAcessoChange(Sender: TObject);
begin
  if FLendo then Exit;
  Ler;
end;

procedure TfbTarBasica.Ler;
begin
  mtCor.Open;
  mtEtapas.Open;
  mtCor.EmptyTable;
  mtEtapas.EmptyTable;
  LeEtapas;
  LeCores;
  LeHoraCor;
  mtCor.Refresh;
  Alterou := False;
end;

procedure TfbTarBasica.Salvar;
begin
  with Dados do begin
    DB.StartTransactionWith([tbTarifa, tbHoraCor]);
    try
      SalvaCores;
      SalvaHoraCor;
      SalvaEtapas;
      DB.Commit;
      CM.RefreshPrecosServidor;
    except
      tbTarifa.Cancel;
      tbHoraCor.Cancel;
      if DB.InTransaction then DB.Rollback;
      Raise;
    end;
  end;
  Alterou := False;
end;

procedure TfbTarBasica.LeCores;
begin
  with Dados do begin
    tbTarifa.SetRange([TipoAcesso], [TipoAcesso]);
    tbTarifa.DisableControls;
    try
      tbTarifa.First;
      while not tbTarifa.Eof do begin
        mtCor.Insert;
        TransfDados(tbTarifa, mtCor);
        mtCor.Post;
        tbTarifa.Next;
      end;
    finally
      tbTarifa.EnableControls;
      tbTarifa.CancelRange;
    end;  
    mtCor.First;
  end;
end;

procedure TfbTarBasica.LeEtapas;
var 
  TempoAnt: TDateTime;
  ValorAnt : Double;
  CorAnt: Integer;
begin
  mtEtapas.MasterSource := nil;
  with Dados do
  try
    TempoAnt := 0;
    ValorAnt := 0;
    tbETar.SetRange([TipoAcesso], [TipoAcesso]);
    tbETar.First;
    while not tbETar.Eof do begin
      CorAnt := tbETarCor.Value;
      mtEtapas.Insert;
      TransfDados(tbETar, mtEtapas);
      mtEtapasTempo.Value := mtEtapasTempo.Value + TempoAnt;
      mtEtapasValor.Value := mtEtapasValor.Value + ValorAnt;
      TempoAnt := TempoAnt + tbETarTempo.Value;
      ValorAnt := ValorAnt + tbETarValor.Value;
      mtEtapas.Post;
      tbETar.Next;
      if (CorAnt <> tbETarCor.Value) then begin
        TempoAnt := 0;
        ValorAnt := 0;
      end;
    end;
  finally
    tbETar.CancelRange;
    mtEtapas.MasterSource := dsCor;
  end;  
end;

procedure TfbTarBasica.LeHoraCor;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  with Dados do begin
    for Dia := 1 to 7 do
    for H := 0 to 23 do begin
      SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
      if tbHoraCor.FindKey([TipoAcesso, Dia, H]) and
         mtCor.FindKey([tbHoraCorCor.Value]) then
      begin
        SB.Color := mtCorCor.Value;
        SB.Font.Color := InverseColor(SB.Color);
      end else
      begin
        SB.Color := clSilver;
        SB.Font.Color := clGray;
      end;  
    end;  
  end;
end;

procedure TfbTarBasica.SalvaCores;
begin
  with Dados do begin
    tbTarifa.SetRange([TipoAcesso], [TipoAcesso]);
    try
      while not (tbTarifa.Eof and tbTarifa.Bof) do tbTarifa.Delete;
      
      mtCor.First;
      while not mtCor.Eof do begin
        tbTarifa.Insert;
        tbTarifaTipoAcesso.Value := TipoAcesso;
        TransfDados(mtCor, tbTarifa);
        tbTarifa.Post;
        mtCor.Next;
      end;
    finally
      tbTarifa.CancelRange;
    end;  
    mtCor.First;
  end;
end;

procedure TfbTarBasica.SalvaEtapas;
var 
  TempoAnt: TDateTime;
  ValorAnt: Double;
  CorAnt: Integer;
begin
  mtEtapas.MasterSource := nil;
  with Dados do
  try
    tbETar.SetRange([TipoAcesso], [TipoAcesso]);
    tbETar.DeleteRecords;
    mtEtapas.First;
    TempoAnt := 0;
    ValorAnt := 0;
    while not mtEtapas.Eof do begin
      CorAnt := mtEtapasCor.Value;
      tbETar.Insert;
      TransfDados(mtEtapas, tbETar);
      tbETarTempo.Value := tbETarTempo.Value - TempoAnt;
      tbETarValor.Value := tbETarValor.Value - ValorAnt;
      TempoAnt := mtEtapasTempo.Value;
      ValorAnt := mtEtapasValor.Value;
      tbETar.Post;
      mtEtapas.Next;
      if (mtEtapasCor.Value<>CorAnt) then begin
        TempoAnt := 0;
        ValorAnt := 0;
      end;
    end;  
  finally
    tbETar.CancelRange;
    mtEtapas.MasterSource := dsCor;
  end;  
end;

procedure TfbTarBasica.SalvaHoraCor;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  with Dados do
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if tbHoraCor.FindKey([TipoAcesso, Dia, H]) then
      tbHoraCor.Edit
    else
      tbHoraCor.Insert;
    tbHoraCorTipoAcesso.Value := TipoAcesso;
    tbHoraCorDia.Value := Dia;
    tbHoraCorHora.Value := H;
    tbHoraCorCor.Value := SB.Color;
    tbHoraCor.Post;    
  end;  
end;

procedure TfbTarBasica.cmSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TfbTarBasica.FiltraDados;
begin
  if cmTiposAcesso.Enabled then begin
    RefreshTiposAcesso;
    Ler;
  end;
end;

procedure TfbTarBasica.MesmaTarifa;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  if mtCor.RecordCount=0 then Exit;
  
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := mtCorCor.Value;
    SB.Font.Color := InverseColor(Sb.Color);
  end;  
end;

procedure TfbTarBasica.btnCriaNovaTarifaClick(Sender: TObject);
var 
  RecAnt : Integer;
begin
  RecAnt := mtCor.RecordCount;
  TFrmCorPreco.Create(Self).Novo;
  if RecAnt<>mtCor.RecordCount then begin
    Alterou := True;
    if RecAnt=0 then MesmaTarifa;
  end;  
end;

procedure TfbTarBasica.btnEditarTarifaClick(Sender: TObject);
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
  CorN : Integer;
begin
  CorA := mtCorCor.Value;
  mtEtapas.CancelRange;
  mtEtapas.SetRange([TipoAcesso, CorA], [TipoAcesso, CorA]);
  if TFrmCorPreco.Create(Self).Editar then
    Alterou := True;

  CorN := mtCorCor.Value;
  
  if (CorA <> CorN) then 
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if SB.Color = CorA then begin
      SB.Color := CorN;
      SB.Font.Color := InverseColor(CorN);
    end;
  end;    
end;

procedure TfbTarBasica.btnApagarTarifaClick(Sender: TObject);
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  if mtCor.RecordCount=0 then Exit;
  if SimNaoH('Confirma a exclusão de '+ mtCorDescricao.AsString + ' ?', Handle) then
  begin
    Alterou := True;
    for Dia := 1 to 7 do
    for H := 0 to 23 do begin
      SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
      if mtCorCor.Value = SB.Color then begin
        SB.Color := clSilver;
        SB.Font.Color := clGray;
      end;  
    end;
    mtEtapas.CancelRange;
    mtEtapas.SetRange([TipoAcesso, mtCorCor.Value], [TipoAcesso, mtCorCor.Value]);
    mtEtapas.First;
    while not mtEtapas.Eof do mtEtapas.Delete;
    mtCor.Delete;
  end;  
end;

procedure TfbTarBasica.FrmBasePaiCreate(Sender: TObject);
var I : Integer;
begin
  inherited;
  fbTarBasica := Self;
  mtCor.Open;
  mtEtapas.Open;
  tAux.Open;
  if Screen.Width=640 then
  for I := 0 to ComponentCount-1 do 
    if Components[I] is TLmdSpeedButton then
      TLmdSpeedButton(Components[I]).Width := 21;
end;

class function TfbTarBasica.Descricao: String;
begin
  Result := 'Tarifação Básica';
end;

procedure TfbTarBasica.cmCancelarClick(Sender: TObject);
begin
  Ler;
end;

procedure TfbTarBasica.AtualizaDireitos;
begin
  if Screen.Width<>640 then inherited;
  Dados.tbTipoAcesso.Refresh;
  RefreshTiposAcesso;
  if Permitido(daCFGPrecos) then
    cmSalvar.Visible := ivAlways   else
    cmSalvar.Visible := ivNever;  
  panHorarios.Enabled := Permitido(daCFGPrecos);
  btnCriaNovaTarifa.Enabled := Permitido(daCFGPrecos);
  btnApagarTarifa.Enabled := btnCriaNovaTarifa.Enabled;
  if Screen.Width=640 then begin
    cmSalvar.GlyphLayout := glLeft;
    cmCancelar.GlyphLayout := glLeft;
  end;
end;

end.
