unit ucmaFrmCorPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDCustomControl, LMDCustomPanel, Variants,
  LMDCustomBevelPanel, LMDSimplePanel, dxBar, dxBarDBNav, dxBarExtItems,
  Db, kbmMemTable, LMDButtonControl, LMDCustomCheckBox,
  LMDCheckBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxCurrencyEdit,
  cxTimeEdit, cxButtonEdit, cxTextEdit, cxMaskEdit, cxVGrid, cxDBVGrid,
  cxInplaceContainer, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxContainer, cxCheckBox, cxDBEdit,
  cxColorComboBox, cxGridCustomPopupMenu, cxGridPopupMenu, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  cxGridDBTableView, cxCheckComboBox, cxImageComboBox, cxLabel, cxGroupBox,
  cxRadioGroup;

type
  TFrmCorPreco = class(TForm)
    BarMgr: TdxBarManager;
    cmNovoPreco: TdxBarButton;
    cmApagar: TdxBarButton;
    cmCancelar: TdxBarLargeButton;
    cmGravar: TdxBarLargeButton;
    dxBarDBNavDelete1: TdxBarDBNavButton;
    dxBarDBNavInsert1: TdxBarDBNavButton;
    dxBarDBNavCancel1: TdxBarDBNavButton;
    dxBarDBNavPost1: TdxBarDBNavButton;
    dxBarDockControl1: TdxBarDockControl;
    ColD: TColorDialog;
    tCor: TkbmMemTable;
    tCorTipoAcesso: TWordField;
    tCorCor: TIntegerField;
    tCorCorFonte: TIntegerField;
    tCorDescricao: TStringField;
    tCorReinicia: TBooleanField;
    dsCor: TDataSource;
    tEtapas: TkbmMemTable;
    dsEtapas: TDataSource;
    tEtapasTipoAcesso: TWordField;
    tEtapasCor: TIntegerField;
    tEtapasCorFonte: TIntegerField;
    tEtapasValor: TCurrencyField;
    tEtapasTempo: TDateTimeField;
    tEtapasValorMin: TCurrencyField;
    tEtapasTolerancia: TDateTimeField;
    tEtapasPos2: TAutoIncField;
    dxBarStatic1: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    tEtapasTempoFrac: TTimeField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    tEtapasMaxTol: TTimeField;
    LMDSimplePanel1: TLMDSimplePanel;
    panEtapas: TLMDSimplePanel;
    dxBarDockControl3: TdxBarDockControl;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    VG: TcxDBVerticalGrid;
    VGDescricao: TcxDBEditorRow;
    VGCor: TcxDBEditorRow;
    cmSimular: TdxBarLargeButton;
    cxGridPopupMenu1: TcxGridPopupMenu;
    mtSim: TkbmMemTable;
    mtSimValor: TCurrencyField;
    dsSim: TDataSource;
    tvSim: TcxGridDBTableView;
    glSim: TcxGridLevel;
    gridSim: TcxGrid;
    tvSimTempo: TcxGridDBColumn;
    tvSimValor: TcxGridDBColumn;
    mtAux: TkbmMemTable;
    mtAuxTipoAcesso: TWordField;
    mtAuxCor: TIntegerField;
    mtAuxCorFonte: TIntegerField;
    mtAuxValor: TCurrencyField;
    mtAuxTempo: TDateTimeField;
    mtAuxValorMin: TCurrencyField;
    mtAuxTolerancia: TDateTimeField;
    mtAuxPos2: TAutoIncField;
    tEtapasFracionar: TBooleanField;
    TV: TcxGridDBTableView;
    TVValor: TcxGridDBColumn;
    TVTempo: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    tEtapasValorAnt: TCurrencyField;
    tEtapasTempoAnt: TDateTimeField;
    cmEditarEtapa: TdxBarButton;
    tEtapasFracSt: TStringField;
    TVFracSt: TcxGridDBColumn;
    mtSimTempo: TStringField;
    mtSimNegrito: TBooleanField;
    tvSimColumn1: TcxGridDBColumn;
    dxBarStatic2: TdxBarStatic;
    gbTempoMaior: TcxRadioGroup;
    cmInstrucoes: TdxBarLargeButton;
    mtSimID: TIntegerField;
    tvSimColumn2: TcxGridDBColumn;
    procedure tEtapasAfterScroll(DataSet: TDataSet);
    procedure cmInstrucoesClick(Sender: TObject);
    procedure gbTempoMaiorPropertiesChange(Sender: TObject);
    procedure tvSimCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmEditarEtapaClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure InspCorButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure InspCorFonteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure tCorAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoPrecoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure tEtapasCalcFields(DataSet: TDataSet);
    procedure tEtapasAfterInsert(DataSet: TDataSet);
    procedure tCorAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    FIncluir : Boolean;
    FSalvou  : Boolean;
    { Private declarations }
    procedure LePrecos;
    procedure LimpaBrancos;
    procedure SalvaPrecos;
    procedure Tarifar;
    function CorPrecosVazio: Boolean;
  public
    { Public declarations }
    procedure Novo;
    function Editar: Boolean;
  end;

var
  FrmCorPreco: TFrmCorPreco;

implementation

uses ucmafbTarBasica, ucmaDM, cmIDRecursos, ucmaPri, ufmImagens, ucmaFrmEtapa,
  ucmaHistVer;

{$R *.DFM}


procedure TFrmCorPreco.cmGravarClick(Sender: TObject);
var Qtd: Integer;
begin
  PostInspectors(Self);
  if tEtapas.State in [dsEdit, dsInsert] then
    tEtapas.Post;

  LimpaBrancos;
    
  if tEtapas.RecordCount=0 then begin
    Beep;
    ShowMessage('Não foi definido nenhum preço!');
    Exit;
  end;  
  if Trim(tCorDescricao.Value)='' then begin
    Beep;
    ShowMessage('Não foi digitado o nome dessa tarifa!');
    Exit;
  end;  
  if tCorCor.Value = clSilver then begin
    Beep;
    ShowMessage('Você não selecionou a cor');
    Exit;
  end;  
  
  Qtd := 0;
  tEtapas.First;
  while not tEtapas.Eof do begin
    if not CorPrecosVazio then begin
      if tEtapasFracionar.Value then begin
        if (tEtapasValor.Value>0) and (tEtapasValorMin.Value < 0.0001) then
          Raise Exception.Create('Valor da fração mínima não pode ser zero !');

        if (tEtapasValor.Value<tEtapasValorMin.Value) then 
          Raise Exception.Create('Valor da fração mínima não pode ser maior que o preço !');
      end;
        
      if FormatDateTime('hh:mm:ss', tEtapasTempo.Value) < '00:00:01' then
        Raise Exception.Create('Tempo não pode ser zero!');
      Inc(Qtd);  
    end;    
    
    tEtapas.Next;
  end;

  if Qtd=0 then 
    Raise Exception.Create('Não foi digitada nenhuma etapa de tarifação');

  if tCor.State in [dsEdit, dsInsert] then tCor.Post;

  SalvaPrecos;
  
  if FIncluir then 
    fbTarBasica.mtCor.Insert
  else
    fbTarBasica.mtCor.Edit;
    
  TransfDados(tCor, fbTarBasica.mtCor); 
  try 
    fbTarBasica.mtCor.Post;
  except
    Raise Exception.Create('Cor Repetida!');
  end;  
  Close;
end;

procedure TFrmCorPreco.cmInstrucoesClick(Sender: TObject);
begin
  TFrmRTF.Create(Self).Mostrar('Tarifa', 'telatarifa.rtf');
end;

procedure TFrmCorPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCorPreco.cmCancelarClick(Sender: TObject);
begin
  Close;
  FSalvou := False;
end;

procedure TFrmCorPreco.cmEditarEtapaClick(Sender: TObject);
var E, EA: TEtapaRec;
begin
  if tEtapas.RecordCount=0 then Exit;
  E.erTempo := tEtapasTempo.Value;
  E.erValor := tEtapasValor.Value;
  E.erFracao := tEtapasValorMin.Value;
  EA.erValor := 0;
  EA.erTempo := 0;
  EA.erFracao := 0;
  
  if mtAux.RecordCount>1 then
  if mtAux.FindNearest([tEtapasPos2.Value-1]) then
  begin
    if (mtAuxPos2.Value >= tEtapasPos2.Value) and (not mtAux.Bof) then
      mtAux.Prior;
    if mtAuxPos2.Value < tEtapasPos2.Value then begin
      EA.erValor := mtAuxValor.Value;
      EA.erTempo := mtAuxTempo.Value;
      EA.erFracao := mtAuxValorMin.Value;
    end;
  end;
  if not TFrmEtapa.Create(Self).Editar(@E, @EA) then Exit;

  tEtapas.Edit;
  tEtapasValor.Value := E.erValor;
  tEtapasTempo.Value := E.erTempo;
  tEtapasValorMin.Value := E.erFracao;
  tEtapasFracionar.Value := (tEtapasValorMin.Value <  (E.erValor - EA.erValor));
  tEtapas.Post;
  Tarifar;
end;

procedure TFrmCorPreco.InspCorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if not (tCor.State in [dsInsert, dsEdit]) then tCor.Edit;
  ColD.Color := tCorCor.Value;
  if ColD.Execute then 
    tCorCor.Value := ColD.Color;
end;

procedure TFrmCorPreco.InspCorFonteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if not (tCor.State in [dsInsert, dsEdit]) then tCor.Edit;
  ColD.Color := tCorCorFonte.Value;
  if ColD.Execute then 
    tCorCorFonte.Value := ColD.Color;
end;

procedure TFrmCorPreco.tCorAfterInsert(DataSet: TDataSet);
begin
  tCorTipoAcesso.Value := fbTarBasica.TipoAcesso;
//  tCorCor.Value := clSilver;
  tCorCor.Clear;
  tCorCorFonte.Value := clBlack;
  tCorReinicia.Value := False;
end;

function TFrmCorPreco.Editar: Boolean;
begin
  FSalvou := False;
  FIncluir := False;
  tCor.Insert;
  TransfDados(fbTarBasica.mtCor, tCor);
  tCor.Post;
  if tCorReinicia.Value then
    gbTempoMaior.ItemIndex := 1;
    
  LePrecos;
//  Tarifar;
  ShowModal;
  Result := FSalvou;
end;

procedure TFrmCorPreco.Novo;
begin
  FIncluir := True;
  tCor.Insert;
  ShowModal;
end;

procedure TFrmCorPreco.LePrecos;
begin
  tEtapas.DisableControls;
  try
    with fbTarBasica do begin
      mtEtapas.First;
      while not mtEtapas.Eof do begin
        tEtapas.Append;
        TransfDados(mtEtapas, tEtapas);
        tEtapasFracionar.Value := ((tEtapasValor.Value-tEtapasValorAnt.Value)>tEtapasValorMin.Value);
        tEtapas.Post;
        mtEtapas.Next;
      end;
    end;    
  finally
    tEtapas.EnableControls;
  end;    
end;

procedure TFrmCorPreco.LimpaBrancos;
var 
  UTempo : TDateTime;
  UValor, R : Double;
  
begin
  UTempo := 0;
  UValor := 0;
  tEtapas.First;
  while not tEtapas.Eof do begin
    if CorPrecosVazio then
      tEtapas.Delete
    else begin
      if not tEtapasFracionar.Value then
      begin
        tEtapas.Edit;
        tEtapasValorMin.Value := tEtapasValor.Value - tEtapasValorAnt.Value;
        tEtapas.Post;
      end;
      if tEtapasTempo.Value < UTempo then
        Raise Exception.Create('Tempo não pode diminuir');

      if tEtapasValor.Value < UValor then
        Raise Exception.Create('Valor não pode diminuir');
      if tEtapasValorMin.Value>0 then begin
        R := (tEtapasValor.Value - tEtapasValorAnt.Value) / tEtapasValorMin.Value;
        if Frac(R)>0 then
          Raise Exception.Create('Valor da divisão em sub-etapas tem que dar conta exata');
      end;
      UTempo := tEtapasTempo.Value;
      UValor := tEtapasValor.Value;
      tEtapas.Next;
    end;
  end;
  tEtapas.First;
end;

procedure TFrmCorPreco.SalvaPrecos;
var I: Integer;
begin
  tEtapas.DisableControls;
  try
    with fbTarBasica do begin
    
      if not FIncluir then
      while mtEtapas.Locate('Cor', mtCorCor.Value, []) do
        mtEtapas.Delete;
        
      tEtapas.First;
      I := 0;
      while not tEtapas.Eof do begin
        if not CorPrecosVazio then begin
          Inc(I);
          mtEtapas.Insert;
          TransfDados(tEtapas, mtEtapas);
          if not tEtapasFracionar.Value then
            mtEtapasValorMin.Value := tEtapasValor.Value - tEtapasValorAnt.Value;
            
          mtEtapasTipoAcesso.Value := TipoAcesso;
          mtEtapasCor.Value := tCorCor.Value;
          mtEtapasPos.Value := I;
          mtEtapas.Post;
        end;  
        tEtapas.Next;
      end;
    end;    
  finally
    tEtapas.EnableControls;
   end;   
end;

procedure TFrmCorPreco.Tarifar;
var T, ST: Double;
    H, HA, Maximo: TDateTime;
    wH, wM, wS, wMS: Word;

    

function ObtemTempoSt: String;
begin
  Result := FormatDateTime('hh:mm:ss', HA) + '  a  ' + FormatDateTime('hh:mm:ss',H);
  DecodeTime(H, wH, wM, wS, wMS);
  mtSimNegrito.Value := (wS=0) and (((wH*60+wM) mod 30)=0);
end;
    
begin
  gbTempoMaior.Visible := (tEtapas.RecordCount>1);
  if gbTempoMaior.Visible then begin
    tEtapas.Last;
    gbTempoMaior.Caption := 'Como tarifar mais que ' + TempoSt(FormatDateTime('hh:mm:ss', tEtapasTempo.Value))+' de uso ?';
    gbTempoMaior.Properties.Items[0].Caption := 'Basear-se apenas no ultimo TEMPO x VALOR (cobrar ' + 
                                                FloatToStrF(tEtapasValorMin.Value, ffCurrency, 15, 2) + ' a cada ' +
                                                TempoSt(FormatDateTime('hh:mm:ss', tEtapasTempoFrac.Value)) + ')';
  end;

  dsEtapas.DataSet := nil;
  dsSim.Dataset := nil;
  try
    TV.DataController.PostEditingData;
    if tEtapas.State in [dsEdit, dsInsert] then
      tEtapas.Post;
    LimpaBrancos;
    tEtapas.First;
    H := 0;
    HA := 0;
    T := 0;
    Maximo := EncodeTime(10, 0, 0, 0);
    mtSim.EmptyTable;
    if tEtapas.RecordCount=0 then Exit;

    while not tEtapas.Eof do begin
      ST := 0;
      if (tEtapasValor.Value-tEtapasValorAnt.Value)<0.00001 then begin
        H  := H + tEtapasTempoFrac.Value;
        mtSim.Append;
        mtSimTempo.Value := ObtemTempoSt;
        mtSimValor.Value := T;
        mtSimID.Value := tEtapasPos2.Value;
        mtSim.Post;
        HA := H;
      end else
      while (H<Maximo) and (((tEtapasValor.Value-tEtapasValorAnt.Value)-ST) > 0.0001) do begin
        ST := ST + tEtapasValorMin.Value;
        T  := T + tEtapasValorMin.Value;
        H  := H + tEtapasTempoFrac.Value;
        mtSim.Append;
        mtSimTempo.Value := ObtemTempoSt;
        mtSimValor.Value := T;
        mtSimID.Value := tEtapasPos2.Value;
        mtSim.Post;
        HA := H;
      end;
      tEtapas.Next;
      if (tEtapas.Eof) and (H<Maximo) and tCorReinicia.Value then
        tEtapas.First;
    end; 
  
    if (H<Maximo) and (not tCorReinicia.Value) then
    while (H<Maximo) do begin
      ST := 0;
      if (tEtapasValor.Value-tEtapasValorAnt.Value)<0.00001 then begin
        H  := H + tEtapasTempoFrac.Value;
        if tEtapasTempoFrac.Value=0 then Exit;
        
        mtSim.Append;
        mtSimTempo.Value := ObtemTempoSt;
        mtSimValor.Value := T;
//        mtSimID.Value := tEtapasPos2.Value;
        mtSim.Post;
        HA := H;
      end else
      while (H<Maximo) and (((tEtapasValor.Value-tEtapasValorAnt.Value)-ST)> 0.0001) do begin
        ST := ST + tEtapasValorMin.Value;
        T  := T + tEtapasValorMin.Value;
        H  := H + tEtapasTempoFrac.Value;
        if tEtapasTempoFrac.Value=0 then Exit;
        
        mtSim.Append;
        mtSimTempo.Value := ObtemTempoSt;
        mtSimValor.Value := T;
//        mtSimID.Value := tEtapasPos2.Value;
        mtSim.Post;
        HA := H;
      end;
    end;
  finally
    dsEtapas.Dataset := tEtapas;
    dsSim.Dataset := mtSim;
  end;
  mtSim.First;
end;

procedure TFrmCorPreco.FormCreate(Sender: TObject);
begin
  tCor.Open;
  tEtapas.Open;
end;

procedure TFrmCorPreco.cmNovoPrecoClick(Sender: TObject);
var E, EA: TEtapaRec;
begin
  if tEtapas.RecordCount=0 then begin
    E.erTempo := 0;
    E.erValor := 0;
    E.erFracao := 0;
    EA := E;
  end else begin
    tEtapas.Last;
    EA.erValor := tEtapasValor.Value;
    EA.erTempo := tEtapasTempo.Value;
    EA.erFracao := tEtapasValorMin.Value;
    E.erTempo := 0;
    E.erValor := 0;
    E.erFracao := 0;
  end;
  if not TFrmEtapa.Create(Self).Editar(@E, @EA) then Exit;

  if tEtapas.IsEmpty then 
    tEtapas.Insert 
  else
    tEtapas.Append;
  tEtapasValor.Value := E.erValor;
  tEtapasTempo.Value := E.erTempo;
  tEtapasValorMin.Value := E.erFracao;
  tEtapasFracionar.Value := (tEtapasValorMin.Value <  (E.erValor - EA.erValor));
  tEtapas.Post;
  Tarifar;
end;

procedure TFrmCorPreco.cmApagarClick(Sender: TObject);
begin
  if tEtapas.RecordCount > 0 then begin
    tEtapas.Delete;
    Tarifar;
  end;
end;

function InverseColor( color: TColor ): TColor;
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
end;

function CalcTempoFrac(ValorFrac, Valor, ValorAnt: Double; Tempo, TempoAnt: TDateTime): TDateTime;
begin
  if (Valor=0) or (Valor<=ValorAnt) then
    Result := Tempo - TempoAnt
  else
    Result := (ValorFrac / (Valor-ValorAnt)) * (Tempo - TempoAnt);
end;

procedure TFrmCorPreco.tEtapasCalcFields(DataSet: TDataSet);
var 
  TempoAnt : TDateTime;
  ValorAnt : Double;
begin
  TempoAnt := 0;
  ValorAnt := 0;
  if mtAux.RecordCount>0 then
  if mtAux.FindNearest([tEtapasPos2.Value-1]) then
  begin
    if (mtAuxPos2.Value >= tEtapasPos2.Value) and (not mtAux.Bof) then
      mtAux.Prior;
    if mtAuxPos2.Value < tEtapasPos2.Value then begin
      TempoAnt := mtAuxTempo.Value;
      ValorAnt := mtAuxValor.Value;
    end;
  end;
  tEtapasValorAnt.Value := ValorAnt;
  tEtapasTempoAnt.Value := TempoAnt;

  tEtapasTempoFrac.Value := CalcTempoFrac(tEtapasValorMin.Value, tEtapasValor.Value, ValorAnt, tEtapasTempo.Value, TempoAnt);
  if tEtapasValorMin.Value < (tEtapasValor.Value - ValorAnt) then
    tEtapasFracSt.Value := 'Cobrar ' + FloatToStrF(tEtapasValorMin.Value, ffCurrency, 10, 2) + ' a cada ' +
                           TempoSt(FormatDateTime('hh:mm:ss', tEtapasTempoFrac.Value))
  else                           
    tEtapasFracSt.Value := 'Sem dividir em sub-etapas';

  if Dados.tbConfigTolerancia.Value > (tEtapasTempoFrac.Value / 2) then
    tEtapasMaxTol.Value := (tEtapasTempoFrac.Value / 2)
  else
    tEtapasMaxTol.Value := Dados.tbConfigTolerancia.Value;  
end;

procedure TFrmCorPreco.tvSimCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  if tEtapas.RecordCount<2 then Exit;

  V := AviewInfo.GridRecord.Values[3];
  if (V<>null) and (V=tEtapasPos2.Value) then begin
{    if AviewInfo.Selected then
      ACanvas.Canvas.Font.Color := clWhite else
      ACanvas.Canvas.Font.Color := clNavy;}
    ACanvas.Canvas.Font.Color := clWhite;
    ACanvas.Canvas.Brush.Color := clNavy;
    if AViewInfo.Selected then
      ACanvas.Canvas.Brush.Color := $006A0000;
  end else
    if AViewInfo.Selected then
      ACanvas.Canvas.Brush.Color := clSilver;
end;

procedure TFrmCorPreco.tEtapasAfterInsert(DataSet: TDataSet);
begin
  FSalvou := True;
  if tEtapas.State=dsInsert then
    tEtapasFracionar.Value := False;
end;

procedure TFrmCorPreco.tEtapasAfterScroll(DataSet: TDataSet);
begin
  mtSim.refresh;
end;

procedure TFrmCorPreco.tCorAfterOpen(DataSet: TDataSet);
begin
  FSalvou := True;
end;

procedure TFrmCorPreco.FormShow(Sender: TObject);
begin
  Tarifar;
  VG.FocusedRow := VGCor;
  VG.FocusedRow := VGDescricao;
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

procedure TFrmCorPreco.gbTempoMaiorPropertiesChange(Sender: TObject);
begin
  if not (tCor.State in [dsEdit, dsInsert]) then
    tCor.Edit;

  tCorReinicia.Value := (gbTempoMaior.ItemIndex=1);
  Tarifar;
end;

function TFrmCorPreco.CorPrecosVazio: Boolean;
begin
  Result := (FormatDateTime('hhmmss', tEtapasTempo.Value)='000000');
end;

end.

Uma tarifa representa as regras de tempos e valores correspondentes a serem cobrados
dos clientes. É possível ter tarifas diferenciadas conforme o dia da semana ou horário do dia.
Por essa razão 


Você deve informar qual é o valor a ser cobrado por cada quantidade de tempo de uso.
Não é necessário criar todas combinações de tempo e valor possíveis pois o sistema calcula
automaticamente a continuidade da tarifação.
 
No quadro à direita você pode acompanhar como ficará a tarifação conforme você vão
sendo digitados os tempos e valores. 


