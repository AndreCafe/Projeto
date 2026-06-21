unit uCMFrmHoraCor;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  LMDCustomComponent, LMDApplicationCtrl, dxBar, Db, kbmMemTable, dxDBTLCl,
  dxGrClms, dxInspct, dxDBInsp, dxInspRw, dxDBInRw, nxdb, dxBarExtItems,
  dxPageControl, dxExEdtr, dxEdLib, dxDBELib, dxEditor, StdCtrls,
  LMDCustomSimpleLabel, LMDSimpleLabel;

type
  TFrmHoraCor = class(TForm)
    BarMgr: TdxBarManager;
    cmNovoPreco: TdxBarButton;
    cmApagar: TdxBarButton;
    dsCor: TDataSource;
    dxBarDockControl2: TdxBarDockControl;
    mtCor: TkbmMemTable;
    cmTodos: TdxBarButton;
    cmGravar: TdxBarLargeButton;
    mtCorTipoAcesso: TWordField;
    mtCorCor: TIntegerField;
    mtCorCorFonte: TIntegerField;
    mtCorDescricao: TStringField;
    mtCorReinicia: TBooleanField;
    mtCorPrecos: TkbmMemTable;
    mtCorPrecosTipoAcesso: TWordField;
    mtCorPrecosCor: TIntegerField;
    mtCorPrecosPos: TWordField;
    mtCorPrecosValor: TCurrencyField;
    mtCorPrecosTempo: TDateTimeField;
    mtCorPrecosValorMin: TCurrencyField;
    mtCorPrecosTolerancia: TDateTimeField;
    cmEditar: TdxBarButton;
    tAux: TnxTable;
    tAuxCodigo: TWordField;
    tAuxNome: TStringField;
    stNome: TdxBarStatic;
    ccmNome: TdxBarControlContainerItem;
    cmCancelar: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    mtCorEtapas: TStringField;
    dxPageControl1: TdxPageControl;
    dxTabSheet1: TdxTabSheet;
    dxTabSheet2: TdxTabSheet;
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
    LMDSimplePanel11: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    lbTarifas: TLMDSimpleLabel;
    dockRegras: TdxBarDockControl;
    Grid: TdxDBGrid;
    GridCor: TdxDBGridButtonColumn;
    GridCorDescr: TdxDBGridColumn;
    GridColumn3: TdxDBGridColumn;
    cmNome: TEdit;
    dsCorPrecos: TDataSource;
    btnMesmaTarifa: TLMDSpeedButton;
    cmMesmaTarifa: TdxBarControlContainerItem;
    procedure hora16MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridCorCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure hora10Click(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmNovoPrecoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure GridColumn3GetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure btnMesmaTarifaClick(Sender: TObject);
    procedure mtCorAfterScroll(DataSet: TDataSet);
  private
    FTipoAcesso: Integer;
    FNovo : Boolean;
    CorA, CorFonteA : Integer;
    { Private declarations }
    procedure LeHoraCor;
    procedure SalvaHoraCor;
    procedure LeCores;
    procedure SalvaCores;
    procedure LeCorPrecos;
    procedure SalvaCorPrecos;
    function GetEtapasSt(Cor: Integer): String;
  public
    { Public declarations }
    procedure Editar(aNovo: Boolean);

    property TipoAcesso: Integer
      read FTipoAcesso;
  end;

var
  FrmHoraCor: TFrmHoraCor;

implementation

uses uCMDados, uCMFrmCorPreco, cmIDRecursos, uCMFrmPri;

{$R *.DFM}

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

procedure TFrmHoraCor.hora16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if mtCor.RecordCount=0 then Exit;
  if ssCtrl in Shift then 
  with TLMDSpeedButton(Sender) do begin
    Color := mtCorCor.Value;
    Font.Color := InverseColor(Color);
  end;  
end;

procedure TFrmHoraCor.Editar(aNovo: Boolean);
begin
  FNovo := aNovo;
  if FNovo then begin
    tAux.Last;
    if tAux.RecordCount>0 then
      FTipoAcesso := tAuxCodigo.Value + 1
    else
      FTipoAcesso := 0;
  end else begin      
    FTipoAcesso := Dados.tbTipoAcessoCodigo.Value;
    cmNome.Text := Dados.tbTipoAcessoNome.Value;
  end;  
  LeCorPrecos;
  LeCores;
  LeHoraCor;
  mtCor.Refresh;
  ShowModal;
end;

procedure TFrmHoraCor.LeCores;
begin
  with Dados do begin
    tbCor.SetRange([FTipoAcesso], [FTipoAcesso]);
    tbCor.DisableControls;
    try
      tbCor.First;
      while not tbCor.Eof do begin
        mtCor.Insert;
        TransfDados(tbCor, mtCor);
        mtCor.Post;
        tbCor.Next;
      end;
    finally
      tbCor.EnableControls;
      tbCor.CancelRange;
    end;  
    mtCor.First;
  end;
end;

procedure TFrmHoraCor.LeCorPrecos;
begin
  mtCorPrecos.MasterSource := nil;
  with Dados do
  try
    tbCorPrecos.SetRange([FTipoAcesso], [FTipoAcesso]);
    tbCorPrecos.First;
    while not tbCorPrecos.Eof do begin
      mtCorPrecos.Insert;
      TransfDados(tbCorPrecos, mtCorPrecos);
      mtCorPrecos.Post;
      tbCorPrecos.Next;
    end;
  finally
    tbCorPrecos.CancelRange;
    mtCorPrecos.MasterSource := dsCor;
  end;  
end;

procedure TFrmHoraCor.SalvaCorPrecos;
begin
  mtCorPrecos.MasterSource := nil;
  with Dados do
  try
    tbCorPrecos.SetRange([FTipoAcesso], [FTipoAcesso]);
    tbCorPrecos.DeleteRecords;
    mtCorPrecos.First;
    while not mtCorPrecos.Eof do begin
      tbCorPrecos.Insert;
      TransfDados(mtCorPrecos, tbCorPrecos);
      tbCorPrecos.Post;
      mtCorPrecos.Next;
    end;  
  finally
    tbCorPrecos.CancelRange;
    mtCorPrecos.MasterSource := dsCor;
  end;  
end;

procedure TFrmHoraCor.LeHoraCor;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  with Dados do begin
    for Dia := 1 to 7 do
    for H := 0 to 23 do begin
      SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
      if tbHoraCor.FindKey([FTipoAcesso, Dia, H]) and
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

procedure TFrmHoraCor.SalvaHoraCor;
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  with Dados do
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if tbHoraCor.FindKey([FTipoAcesso, Dia, H]) then
      tbHoraCor.Edit
    else
      tbHoraCor.Insert;
    tbHoraCorTipoAcesso.Value := FTipoAcesso;
    tbHoraCorDia.Value := Dia;
    tbHoraCorHora.Value := H;
    tbHoraCorCor.Value := SB.Color;
    tbHoraCor.Post;    
  end;  
end;

procedure TFrmHoraCor.SalvaCores;
begin
  with Dados do begin
    tbCor.SetRange([FTipoAcesso], [FTipoAcesso]);
    try
      while not (tbCor.Eof and tbCor.Bof) do tbCor.Delete;
      
      mtCor.First;
      while not mtCor.Eof do begin
        tbCor.Insert;
        tbCorTipoAcesso.Value := FTipoAcesso;
        TransfDados(mtCor, tbCor);
        tbCor.Post;
        mtCor.Next;
      end;
    finally
      tbCor.CancelRange;
    end;  
    mtCor.First;
  end;
end;

procedure TFrmHoraCor.cmGravarClick(Sender: TObject);
begin
  if FNovo and (cmNome.Text='') then begin
    Beep;
    ShowMessage('É necessário digitar um Nome para este Tipo de Acesso!');
    Exit;
  end;  
  with Dados do begin
    DB.StartTransactionWith([tbTipoAcesso, tbCor, tbHoraCor]);
    try
      if FNovo then
        tbTipoAcesso.Insert
      else
        tbTipoAcesso.Edit;
      tbTipoAcessoCodigo.Value := FTipoAcesso;
      tbTipoAcessoNome.Value := cmNome.Text;
      tbTipoAcesso.Post;
      SalvaCores;
      SalvaHoraCor;
      SalvaCorPrecos;
      DB.Commit;
      CM.RefreshPrecosServidor;
    except
      tbCor.Cancel;
      tbHoraCor.Cancel;
      DB.Rollback;
      Raise;
    end;
  end;  
  Close;
end;

procedure TFrmHoraCor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmHoraCor.FormCreate(Sender: TObject);
begin
  FrmHoraCor := Self;
  mtCor.Open;
  mtCorPrecos.Open;
  cmGravar.Enabled := Permitido(daCFGPrecos);
  tAux.Open;
end;

procedure TFrmHoraCor.GridCorCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var 
  V : Variant;
begin
  AText := '';
  V := ANode.Values[GridCor.Index];
  if V=null then V := clSilver;
  AColor := V;

{  V := ANode.Values[GridCorFonte.Index];
  if V=null then V := clBlack;
  AFont.Color := V;}
end;

procedure TFrmHoraCor.hora10Click(Sender: TObject);
begin
  if mtCor.RecordCount=0 then Exit;
  with TLMDSpeedButton(Sender) do begin
    Color := mtCorCor.Value;
    Font.Color := InverseColor(Color);
  end;  
end;

procedure TFrmHoraCor.cmApagarClick(Sender: TObject);
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  if mtCor.RecordCount=0 then Exit;
  if MessageDlg('Confirma a exclusão de '+ mtCorDescricao.AsString + ' ?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then 
  begin
    for Dia := 1 to 7 do
    for H := 0 to 23 do begin
      SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
      if mtCorCor.Value = SB.Color then begin
        SB.Color := clSilver;
        SB.Font.Color := clGray;
      end;  
    end;
    mtCorPrecos.CancelRange;
    mtCorPrecos.SetRange([FTipoAcesso, mtCorCor.Value], [FTipoAcesso, mtCorCor.Value]);
    mtCorPrecos.First;
    while not mtCorPrecos.Eof do mtCorPrecos.Delete;
    mtCor.Delete;
  end;  
end;

procedure TFrmHoraCor.FormDestroy(Sender: TObject);
begin
  FrmHoraCor := nil;
end;

procedure TFrmHoraCor.cmEditarClick(Sender: TObject);
var 
  Dia, H : Integer;
  SB : TLmdSpeedButton;
  CorN, CorFonteN : Integer;
begin
  CorA := mtCorCor.Value;
  CorFonteA := mtCorCorFonte.Value;
  mtCorPrecos.CancelRange;
  mtCorPrecos.SetRange([FTipoAcesso, CorA], [FTipoAcesso, CorA]);
  TFrmCorPreco.Create(Self).Editar;

  CorN := mtCorCor.Value;
  CorFonteN := mtCorCorFonte.Value;
  
  if (CorA <> CorN) or (CorFonteA <> CorFonteN) then 
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if SB.Color = CorA then begin
      SB.Color := CorN;
      SB.Font.Color := InverseColor(CorN);
    end;
  end;    
end;

procedure TFrmHoraCor.cmNovoPrecoClick(Sender: TObject);
var Nenhum: Boolean;
begin
  Nenhum := (mtCor.RecordCount=0);
  TFrmCorPreco.Create(Self).Novo;
  if Nenhum and (mtCor.RecordCount>0) then
    btnMesmaTarifaClick(nil);
end;

procedure TFrmHoraCor.FormShow(Sender: TObject);
begin
  Randomize;
  if Dados.CM.Config.VariosTiposAcesso then begin
    if FNovo then cmNome.SetFocus;
  end else begin
    if FNovo then cmNome.Text := 'Padrão';
    ccmNome.Visible := ivNever;
    stNome.Visible := ivNever;
    cmNome.Visible := False;
  end;    
  mtCor.Refresh; 
end;

procedure TFrmHoraCor.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

function TFrmHoraCor.GetEtapasSt(Cor: Integer): String;
begin
  mtCorPrecos.CancelRange;
  mtCorPrecos.SetRange([FTipoAcesso, Cor], [FTipoAcesso, Cor]);
  Result := '';
  try
    while not mtCorPrecos.Eof do begin
      if Result > '' then Result := Result + ', ';
      Result := Result + FormatDateTime('hh:mm:ss', mtCorPrecosTempo.Value) + ' - ' + 
           FloatToStrF(mtCorPrecosValor.Value, ffCurrency, 0, 2);
      mtCorPrecos.Next;
    end;
  finally
    mtCorPrecos.CancelRange;
  end;  
end;

procedure TFrmHoraCor.GridColumn3GetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
var V: Variant;
begin
  V := ANode.Values[gridCor.Index];
  if V <> null then 
    AText := GetEtapasSt(V);
end;

procedure TFrmHoraCor.btnMesmaTarifaClick(Sender: TObject);
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

procedure TFrmHoraCor.mtCorAfterScroll(DataSet: TDataSet);
begin
  if mtCor.RecordCount=0 then begin
    cmMesmaTarifa.Visible := ivNever;
    Exit;
  end else
    cmMesmaTarifa.Visible := ivAlways;
      
  btnMesmaTarifa.Color := mtCorCor.Value;
  btnMesmaTarifa.Font.Color := InverseColor(mtCorCor.Value);
end;

end.
