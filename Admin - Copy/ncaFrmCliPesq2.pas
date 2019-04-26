unit ncaFrmCliPesq2;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,  cxDropDownEdit,
  nxdb, ncClassesBase, 
  dxBarExtItems, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, 
  cxContainer, cxLabel, Buttons, PngSpeedButton, StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, cxBarEditItem;

type
  TDadosCliente = record
    dcCodigo: Integer;
    dcNome  : String;
  end;
  PDadosCliente = ^TDadosCliente;  

  TFrmCliPesq2 = class(TFrmBase)
    Tab: TnxTable;
    TabNome: TStringField;
    TabEndereco: TStringField;                              
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    Tabemail: TMemoField;
    TabUltVisita: TDateTimeField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabSenha: TStringField;
    TabTelefone: TStringField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    dsCli: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVIsento: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVTelefone: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVEscola: TcxGridDBColumn;
    TVDataNasc: TcxGridDBColumn;
    TVCelular: TcxGridDBColumn;
    GL: TcxGridLevel;
    pmTempo: TdxBarPopupMenu;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTipoAcessoPref: TIntegerField;
    TabIncluidoEm: TDateTimeField;
    pmSenha: TdxBarPopupMenu;
    TabPai: TStringField;
    TabMae: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabInativo: TBooleanField;
    TVInativo: TcxGridDBColumn;
    TabFoto: TGraphicField;
    PopupMenu1: TPopupMenu;
    TabID: TAutoIncField;
    TabMinutos: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabValorCred: TCurrencyField;
    TVCredito: TcxGridDBColumn;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    cmOk: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    container_panBusca: TdxBarControlContainerItem;
    TabPassaportes: TFloatField;
    TabTitEleitor: TStringField;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TabAniversario: TStringField;
    TVValorCred: TcxGridDBColumn;
    TVCredPromo: TcxGridDBColumn;
    TimerSync: TTimer;
    TVFor: TcxGridDBTableView;
    TVForNome: TcxGridDBColumn;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabFornecedor: TBooleanField;
    TVEndereco: TcxGridDBColumn;
    dxBarSubItem1: TdxBarSubItem;
    cmNome: TdxBarButton;
    cmUsername: TdxBarButton;
    cmCodigo: TdxBarButton;
    cmRG: TdxBarButton;
    cmCPF: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmDebTempoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure rgNomeClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure TimerSyncTimer(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure TVEditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
  private
    { Private declarations }
    FDadosCli : PDadosCliente;
    FEditControl : TcxCustomDropDownEdit;
    FEntrou : Boolean;
    FProcurar : String;

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
    procedure SetProcurar(const Value: String);
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;

    procedure Reset;

    property Procurar: String
      read FProcurar write SetProcurar;

    function CampoBusca: String;  

    procedure processKey(Key: Word);

    function  GetGrids: TGridArray; override;

    { Public declarations }
  end;

var
  FrmCliPesq2: TFrmCliPesq2;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos, 
  ncaFrmCadCli, ncaFrmCli2;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TFrmCliPesq2.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmEditar.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);

  {$IFDEF Loja}
  TVUsername.Visible := False;
  {$ENDIF}

  TV.DataController.DataSource := dsCli;
  TVFor.DataController.DataSource := nil;
  Tab.Filter := 'Fornecedor<>True'; // do not localize
  Tab.Filtered := True;
  
    if cmNome.Down then begin
      Tab.IndexName := 'INome'; // do not localize
      GL.GridView := TV;
      TVNome.Index := 0;
      TVUsername.Index := 1;
      TVCodigo.Index := 2;
    end else
    if cmUsername.Down then begin
      Tab.IndexName := 'IUsername'; // do not localize
      GL.GridView := TV;
      TVUsername.Index := 0;
      TVNome.Index := 1;
      TVCodigo.Index := 2;
    end else begin
      Tab.IndexName := 'IID'; // do not localize
      GL.GridView := TV;
      TVCodigo.Index := 0;
      TVNome.Index := 1;
      TVUsername.Index := 2;
    end;
    
end;

procedure TFrmCliPesq2.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FEntrou := False;
  LeLayout(Grid, 'especial'); // do not localize
end;

function TFrmCliPesq2.GetGrids: TGridArray;
begin
  SetLength(Result, 0);
end;

procedure TFrmCliPesq2.GridEnter(Sender: TObject);
begin
  inherited;
  FEntrou := True;
end;

procedure TFrmCliPesq2.GridExit(Sender: TObject);
begin
  inherited;
  FEntrou := False;
end;

procedure TFrmCliPesq2.processKey(Key: Word);
begin
  case Key of
    VK_UP : begin
      Tab.Prior;
      with TFrmCli2(Owner) do begin
        if not Popped then Timer1.Enabled := True;
        CliCad := TabID.Value;
        UpdateCliCadEdit(True);
      end;
    end;
    VK_Down : begin
      Tab.Next;
      with TFrmCli2(Owner) do begin
        if not Popped then Timer1.Enabled := True;
        CliCad := TabID.Value;     
        UpdateCliCadEdit(True);
      end;
    end;
    VK_Return : begin
      TFrmCli2(Owner).pmCli.ClosePopup(True);
      TimerSync.Enabled := True;
    end;
    VK_Escape : begin
//      TFrmCli2(Owner).pmCli.ClosePopup(True);
    end;
  end;
end;

procedure TFrmCliPesq2.Reset;
begin
  if Tab.active then begin
      Tab.DisableControls;
      try
        FProcurar := '';
        Tab.CancelRange;
        Tab.First;
      finally
        Tab.EnableControls;
      end;
  end;
end;


procedure TFrmCliPesq2.Biometria(var Msg: TMessage);
begin

end;

procedure TFrmCliPesq2.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDadosCli := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

function TFrmCliPesq2.CampoBusca: String;
begin
  if cmNome.down then
    Result := TabNome.Value
  else
  if cmUsername.Down then
    Result := TabUsername.Value
  else
  if cmCodigo.Down then
    Result := TabID.AsString
  else
  if cmRG.Down then
    Result := TabRG.Value
  else
    Result := TabCPF.Value;
end;

procedure TFrmCliPesq2.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNao(SncaFrmCliPesq_ConfirmaAExclusãoDe+TabNome.Value+' ?') then Tab.Delete;
end;

procedure TFrmCliPesq2.cmDebTempoClick(Sender: TObject);
begin
  inherited;
  if Tab.RecordCount>0 then
//    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, False);
  Tab.Refresh;  
end;

procedure TFrmCliPesq2.cmEditarClick(Sender: TObject);
begin
  inherited;
{  if Tab.IsEmpty then Exit;
  TFrmCli2(Owner).pmCli.ClosePopup(False);
  if not rgFornecedor.Checked then begin
    TFrmCli2(Owner).cmEditarClick(nil);
    Exit;
  end;
  if TFrmCadFornecedor.Create(nil).Editar(Tab, nil) then begin
    with TFrmCli2(Owner) do begin
      CliCad := TabID.Value;
      UpdateCliCadEdit(True);
    end;
  end;}
end;

class function TFrmCliPesq2.Descricao: String;
begin
  Result := SncaFrmCliPesq_Clientes;
end;

function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then 
      Result := Result + S[I];
end;

procedure TFrmCliPesq2.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmCliPesq2.TimerSyncTimer(Sender: TObject);
begin
  inherited;
  TimerSync.Enabled := False;
  with TFrmCli2(Owner) do 
  if (edCad.Text='') and edCad.Focused then
    CliCad := 0 
  else begin
    CliCad := TabID.Value;
    UpdateCliCadEdit(True);
  end;
end;

procedure TFrmCliPesq2.TVColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  SalvaLayout(Grid, 'especial'); // do not localize
end;

procedure TFrmCliPesq2.TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVCredito.Index];
  if V <> null then
    AText := MinutosToHMSStr(V);
end;

procedure TFrmCliPesq2.TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVCredPromo.Index];
  if (V<>null) and (V>0) then
    AText := MinutosToHMSAbrev(V) else
    AText := '';
end;

procedure TFrmCliPesq2.TVDblClick(Sender: TObject);
begin
  inherited;
  TFrmCli2(Owner).CliCad := TabID.Value;
  TFrmCli2(Owner).pmCli.ClosePopup(True);
  TimerSync.Enabled := True;
end;

procedure TFrmCliPesq2.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do 
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TFrmCliPesq2.TVEditKeyUp(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  if Key = KEY_ENTER then begin
    TFrmCli2(Owner).pmCli.ClosePopup(True);
    TimerSync.Enabled := True;
  end;}
    
end;

procedure TFrmCliPesq2.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
{  with TFrmCli2(Owner) do 
  if not IgnoreChange then begin
    if FEntrou or (edCad.Text>'') then
      CliCad := TabID.Value
    else
    if edCad.Focused and (edCad.Text='') then 
      CliCad := 0;
  end;}
end;
                                     
procedure TFrmCliPesq2.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGray;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TFrmCliPesq2.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with aviewinfo do 
  if (Value<>Null) and (Value=True) then begin
    ACanvas.Canvas.Brush.Color := clGreen;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TFrmCliPesq2.AtualizaDireitos;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmEditar.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);
  
  if Tab.Active then Tab.Refresh;
end;

procedure TFrmCliPesq2.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmCliPesq2.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmCliPesq2.cmNovoClick(Sender: TObject);
begin
  TFrmCli2(Owner).pmCli.ClosePopup(False);
end;

procedure TFrmCliPesq2.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmCliPesq2.SetProcurar(const Value: String);
var S: String;
begin
  if Value=FProcurar then Exit;

  FProcurar := Value;

  if TFrmCli2(Owner).IgnoreChange then Exit;
  if cmCodigo.Down then begin
    S := SoDig(FProcurar);
    if S>'' then
      Tab.SetRange([S], [S]) else
      Tab.CancelRange;
  end else
    Tab.SetRange([FProcurar], [FProcurar + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
  
end;

end.

