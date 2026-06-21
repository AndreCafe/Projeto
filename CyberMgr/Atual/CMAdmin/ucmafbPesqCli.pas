unit ucmafbPesqCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,  cxDropDownEdit,
  nxdb, 
  dxBarExtItems, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, 
  cxContainer, cxLabel, Buttons, PngSpeedButton, StdCtrls, cxRadioGroup, Menus,
  ovceditf, ovciseb, ovcdbise, ovcdbhll, OvcDbHNexusDB;

type
  TDadosCliente = record
    dcCodigo: Integer;
    dcNome  : String;
  end;
  PDadosCliente = ^TDadosCliente;  

  TfbPesqCli = class(TFrmBase)
    Tab: TnxTable;
    TabCodigo: TAutoIncField;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabNasc: TDateTimeField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    Tabemail: TMemoField;
    TabCreditoM: TIntegerField;
    TabUltVisita: TDateTimeField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabSenha: TStringField;
    TabTelefone: TStringField;
    TabTempoTotal: TIntegerField;
    TabCreditoHMS: TStringField;
    TabTempoTotalHMS: TStringField;
    TabTempoInicial: TIntegerField;
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
    panMostrar: TPanel;
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
    cxLabel1: TcxLabel;
    rgNome: TcxRadioButton;
    rgUsername: TcxRadioButton;
    rgCod: TcxRadioButton;
    btnEditar: TPngSpeedButton;
    btnNovo: TPngSpeedButton;
    btnOK: TPngSpeedButton;
    btnCancelar: TPngSpeedButton;
    OvcDbNexusDBEngineHelper1: TOvcDbNexusDBEngineHelper;
    Timer1: TTimer;
    edBusca: TcxMaskEdit;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmZerarTempoClick(Sender: TObject);
    procedure cmVenderCredClick(Sender: TObject);
    procedure cmDebTempoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure rgNomeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TVKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmBasePaiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FDadosCli : PDadosCliente;
    FEditControl : TcxCustomDropDownEdit;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;

    procedure PreparaBusca(aDC: PDadosCliente; aEditControl: TcxCustomDropDownEdit);
    
    
    { Public declarations }
  end;

var
  fbPesqCli: TfbPesqCli;
  Primeiro: Boolean = False;

implementation

uses ucmaDM, ufmImagens, ucmaPri, ucmaFrmCredito, cmClassesBase,
  ucmaFrmPass, ucmaFrmCliente, ucmaFrmDeb, cmIDRecursos, ucmaFrmZerarTempo,
  ucmaFrmSenha;

{$R *.dfm}

procedure TfbPesqCli.FiltraDados;
begin
  if not Tab.Active then Tab.Active := True;

  if rgNome.Checked then begin
    Tab.IndexName := 'INome';
    TVNome.Index := 0;
    TVUsername.Index := 1;
    TVCodigo.Index := 2;
    TV.OptionsBehavior.IncSearchItem := TVNome;
    edBusca.Properties.EditMask := '';
  end else
  if rgUsername.Checked then begin
    Tab.IndexName := 'IUsername';
    TVUsername.Index := 0;
    TVNome.Index := 1;
    TVCodigo.Index := 2;
    TV.OptionsBehavior.IncSearchItem := TVUsername;
    edBusca.Properties.EditMask := '';
  end else begin
    Tab.IndexName := 'ICodigo';
    TVCodigo.Index := 0;
    TVNome.Index := 1;
    TVUsername.Index := 2;
    edBusca.Properties.EditMask := '\d+';
    TV.OptionsBehavior.IncSearchItem := TVCodigo;
  end;  
  
  Tab.Filtered := False;
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

procedure TfbPesqCli.FrmBasePaiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
    btnOKClick(nil);
  
end;

procedure TfbPesqCli.cmVenderCredClick(Sender: TObject);
begin
  inherited;
  if NumAberto<1 then begin
    Beep;
    ShowMessage('Caixa está fechado');
    Exit;
  end;
  
  with Dados do begin
    tbAcesso.Refresh;
    TFrmCredito.Create(Self).Novo(tbAcesso, TabCodigo.Value, True);
    Tab.Refresh;
  end;    
end;

procedure TfbPesqCli.cmZerarTempoClick(Sender: TObject);
begin
  inherited;
  case TFrmZeraTempo.Create(Self).Zerar(TabNome.Value) of
    0 : begin
      Tab.Edit;
      TabTempoTotal.Value := 0;
      Tab.Post;
    end;
    1 : begin
      Tab.First;
      while not Tab.Eof do begin
        Tab.Edit;
        TabTempoTotal.Value := 0;
        Tab.Post;
        Tab.Next;
        Application.ProcessMessages;
      end;
      ShowMessage('Tempo acumulado de todos clientes foi zerado com sucesso!');
    end;
  end;
end;

procedure TfbPesqCli.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDadosCli := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TfbPesqCli.btnOKClick(Sender: TObject);
begin
  inherited;
  if FDadosCli<>nil then begin
    FDadosCli.dcCodigo := TabCodigo.Value;
    FDadosCli.dcNome   := TabNome.Value;
    FDadosCli := nil;
  end;

  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;

end;

procedure TfbPesqCli.cmDebTempoClick(Sender: TObject);
begin
  inherited;
  if Tab.RecordCount>0 then
    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, False);
  Tab.Refresh;  
end;

class function TfbPesqCli.Descricao: String;
begin
  Result := 'Clientes';
end;

procedure TfbPesqCli.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : btnOkClick(nil);
    VK_Escape : btnCancelarClick(nil);
  end;
end;

procedure TfbPesqCli.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if rgCod.Checked then begin
    Tab.CancelRange;
    if Trim(edBusca.Text) > '' then
      Tab.FindNearest([Trim(edBusca.Text)]) else
      Tab.First;
  end else
    Tab.SetRange([edBusca.text], [edBusca.Text + 'zzzzzzzzzzzzzzzzzzzzzz']);
end;

procedure TfbPesqCli.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbPesqCli.TabCalcFields(DataSet: TDataSet);
begin
  if TabCreditoM.Value > 0 then
    TabCreditoHMS.Value := TicksToHMSSt(TabCreditoM.Value)
  else
    TabCreditoHMS.Clear; 

  if TabTempoTotal.Value > 0 then
    TabTempoTotalHMS.Value := SegundosToHMSSt(TabTempoTotal.Value);
end;

procedure TfbPesqCli.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  edBusca.SetFocus;
end;

procedure TfbPesqCli.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do 
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbPesqCli.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TfbPesqCli.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TfbPesqCli.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    13 : btnOkClick(nil);
    27 : btnCancelarClick(nil);
  end;
end;

procedure TfbPesqCli.cmNovoClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('Codigo', TabCodigo.Value, []);
end;

procedure TfbPesqCli.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmCliente.Create(Self).Editar(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('Codigo', TabCodigo.Value, []);
end;

procedure TfbPesqCli.AtualizaDireitos;
begin
  inherited;
  btnNovo.Enabled := Permitido(daCliCadastrar);
  if Tab.Active then Tab.Refresh;
end;

procedure TfbPesqCli.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbPesqCli.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbPesqCli.ParentChanged;
begin
  inherited;
  panMostrar.Top := 100;
end;

procedure TfbPesqCli.PreparaBusca(aDC: PDadosCliente;
  aEditControl: TcxCustomDropDownEdit);
begin
  FDadosCli := aDC;
  FEditControl := aEditControl;
  if TV.DataController.Search.Searching then
    TV.DataController.Search.Cancel;

  case Dados.tbConfigCampoLocalizaCli.Value of
    0 : rgNome.Checked := True;
    1 : rgUsername.Checked := True;
    2 : rgCod.Checked := True;  
  end;

  edBusca.Text := '';

  Tab.CancelRange;
  
  if (aDC<>nil) and (aDC.dcCodigo>0) then 
    Tab.Locate('Codigo', aDC.dcCodigo, []);
  
  Timer1.Enabled := True;
end;

procedure TfbPesqCli.rgNomeClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
  if TRadioButton(Sender).Focused then
    edBusca.SetFocus;
end;

end.
