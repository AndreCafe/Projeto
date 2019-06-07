unit ncaFrmCliPesq;
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
  cxContainer, cxLabel, Buttons, StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, uParentedPanel;

type
  TDadosCliente = record
    dcCodigo: Integer;
    dcNome  : String;
  end;
  PDadosCliente = ^TDadosCliente;  

  TFrmCliPesq = class(TFrmBase)
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
    panBusca: TPanel;
    edBusca: TcxMaskEdit;
    rgCod: TcxRadioButton;
    rgUsername: TcxRadioButton;
    rgNome: TcxRadioButton;
    cxLabel1: TcxLabel;
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
    rgFornecedor: TcxRadioButton;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabFornecedor: TBooleanField;
    TVEndereco: TcxGridDBColumn;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmVenderCredClick(Sender: TObject);
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
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
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

    procedure Biometria(var Msg: TMessage);
      message wm_biometria;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;

    procedure Reset;

    function  GetGrids: TGridArray; override;

    { Public declarations }
  end;

var
  FrmCliPesq: TFrmCliPesq;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncaFrmPass, ncIDRecursos, ncaFrmZerarTempo,
  ncaFrmSenha, ncaFrmCadCli, ncaFrmCadFornecedor, ncaFrmCli;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TFrmCliPesq.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmEditar.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);

  if rgFornecedor.Checked then begin
    TV.DataController.DataSource := nil;
    TVFor.DataController.DataSource := dsCli;
    Tab.IndexName := 'IFornecedorNome'; // do not localize
    Tab.SetRange([True], [True]);
    Tab.Filtered := False;
    GL.GridView := TVFor;
    edBusca.Properties.EditMask := '';
    cmApagar.Visible := ivAlways;
  end else begin
    TV.DataController.DataSource := dsCli;
    TVFor.DataController.DataSource := nil;
    Tab.Filter := 'Fornecedor<>True'; // do not localize
    Tab.Filtered := True;
  
    if rgNome.Checked then begin
      Tab.IndexName := 'INome'; // do not localize
      GL.GridView := TV;
      TVNome.Index := 0;
      TVUsername.Index := 1;
      TVCodigo.Index := 2;
      edBusca.Properties.EditMask := '';
    end else
    if rgUsername.Checked then begin
      Tab.IndexName := 'IUsername'; // do not localize
      GL.GridView := TV;
      TVUsername.Index := 0;
      TVNome.Index := 1;
      TVCodigo.Index := 2;
      edBusca.Properties.EditMask := '';
    end else begin
      Tab.IndexName := 'IID'; // do not localize
      GL.GridView := TV;
      TVCodigo.Index := 0;
      TVNome.Index := 1;
      TVUsername.Index := 2;
      edBusca.Properties.EditMask := '\d+';
    end;
  end;
end;

procedure TFrmCliPesq.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FEntrou := False;
  LeLayout(Grid, 'especial'); // do not localize
end;

function TFrmCliPesq.GetGrids: TGridArray;
begin
  SetLength(Result, 0);
end;

procedure TFrmCliPesq.GridEnter(Sender: TObject);
begin
  inherited;
  FEntrou := True;
end;

procedure TFrmCliPesq.GridExit(Sender: TObject);
begin
  inherited;
  FEntrou := False;
end;

procedure TFrmCliPesq.Reset;
begin
  if Tab.active then begin
      Tab.DisableControls;
      try
        edBusca.Clear;
        Tab.CancelRange;
        Tab.First;
      finally
        Tab.EnableControls;
      end;
  end;
end;

procedure TFrmCliPesq.cmVenderCredClick(Sender: TObject);
begin
  inherited;
  if NumAberto<1 then begin
    Beep;
    ShowMessage(SncaFrmCliPesq_CaixaEstáFechado);
    Exit;
  end;
  
  with Dados do begin
//    TFrmCredito.Create(Self).Novo(tbAcesso, TabCodigo.Value, True);
    Tab.Refresh;
  end;    
end;

procedure TFrmCliPesq.Biometria(var Msg: TMessage);
begin

end;

procedure TFrmCliPesq.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDadosCli := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TFrmCliPesq.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNao(SncaFrmCliPesq_ConfirmaAExclusãoDe+TabNome.Value+' ?') then Tab.Delete;
end;

procedure TFrmCliPesq.cmDebTempoClick(Sender: TObject);
begin
  inherited;
  if Tab.RecordCount>0 then
//    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, False);
  Tab.Refresh;  
end;

procedure TFrmCliPesq.cmEditarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;
  TFrmCli(Owner).pmCli.ClosePopup(False);
  if not rgFornecedor.Checked then begin
    TFrmCli(Owner).cmEditarClick(nil);
    Exit;
  end;
  if TFrmCadFornecedor.Create(nil).Editar(Tab, nil) then begin
    with TFrmCli(Owner) do begin
      CliCad := TabID.Value;
      UpdateCliCadEdit(True);
    end;
  end;
end;

class function TFrmCliPesq.Descricao: String;
begin
  Result := SncaFrmCliPesq_Clientes;
end;

procedure TFrmCliPesq.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : begin
      Tab.Prior;
      with TFrmCli(Owner) do begin
        if not Popped then Timer1.Enabled := True;
        CliCad := TabID.Value;
        UpdateCliCadEdit(True);
      end;
    end;
    VK_Down : begin
      Tab.Next;
      with TFrmCli(Owner) do begin
        if not Popped then Timer1.Enabled := True;
        CliCad := TabID.Value;     
        UpdateCliCadEdit(True);
      end;
    end;
    VK_Return : begin
      TFrmCli(Owner).pmCli.ClosePopup(True);
      TimerSync.Enabled := True;
    end;
    VK_Escape : begin
//      TFrmCli(Owner).pmCli.ClosePopup(True);
    end;
  end;
end;

function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then 
      Result := Result + S[I];
end;

procedure TFrmCliPesq.edBuscaPropertiesChange(Sender: TObject);
var S: String;
begin
  inherited;
  if TFrmCli(Owner).IgnoreChange then Exit;
  
  if rgCod.Checked then begin
    S := SoDig(edBusca.Text);
    if S>'' then
      Tab.SetRange([S], [S]) else
      Tab.CancelRange;
  end else
  if rgFornecedor.Checked then 
    Tab.SetRange([True, edBusca.text], [True, edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']) else // do not localize
    Tab.SetRange([edBusca.text], [edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']); // do not localize
end;

procedure TFrmCliPesq.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TFrmCliPesq.TimerSyncTimer(Sender: TObject);
begin
  inherited;
  TimerSync.Enabled := False;
  with TFrmCli(Owner) do 
  if (edCad.Text='') and edCad.Focused then
    CliCad := 0 
  else begin
    CliCad := TabID.Value;
    UpdateCliCadEdit(True);
  end;
end;

procedure TFrmCliPesq.TVColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  SalvaLayout(Grid, 'especial'); // do not localize
end;

procedure TFrmCliPesq.TVCreditoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVCredito.Index];
  if V <> null then
    AText := MinutosToHMSStr(V);
end;

procedure TFrmCliPesq.TVCredPromoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVCredPromo.Index];
  if (V<>null) and (V>0) then
    AText := MinutosToHMSAbrev(V) else
    AText := '';
end;

procedure TFrmCliPesq.TVDblClick(Sender: TObject);
begin
  inherited;
  TFrmCli(Owner).CliCad := TabID.Value;
  TFrmCli(Owner).pmCli.ClosePopup(True);
  TimerSync.Enabled := True;
end;

procedure TFrmCliPesq.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do 
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TFrmCliPesq.TVEditKeyUp(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  if Key = KEY_ENTER then begin
    TFrmCli(Owner).pmCli.ClosePopup(True);
    TimerSync.Enabled := True;
  end;}
    
end;

procedure TFrmCliPesq.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  with TFrmCli(Owner) do 
  if FEntrou or (edCad.Text>'') then
    CliCad := TabID.Value
  else
  if edCad.Focused and (edCad.Text='') then 
    CliCad := 0;
end;
                                     
procedure TFrmCliPesq.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TFrmCliPesq.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TFrmCliPesq.AtualizaDireitos;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmEditar.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);
  
  if Tab.Active then Tab.Refresh;
end;

procedure TFrmCliPesq.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmCliPesq.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TFrmCliPesq.cmNovoClick(Sender: TObject);
begin
  TFrmCli(Owner).pmCli.ClosePopup(False);
  if not rgFornecedor.Checked then begin
    TFrmCli(Owner).cmNovoClick(nil);
    Exit;
  end;
  if TFrmCadFornecedor.Create(nil).Novo(Tab, nil)>-1 then begin
    with TFrmCli(Owner) do begin
      CliCad := TabID.Value;
      UpdateCliCadEdit(True);
    end;
  end;
end;

procedure TFrmCliPesq.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

end.

