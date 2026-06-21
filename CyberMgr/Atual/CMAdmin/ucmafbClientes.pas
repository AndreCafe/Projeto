unit ucmafbClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, 
  nxdb, 
  dxBarExtItems, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxDropDownEdit,
  cxContainer, cxLabel;

type
  TfbClientes = class(TFrmBase)
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
    TVCreditoHMS: TcxGridDBColumn;
    TVTempoTotalHMS: TcxGridDBColumn;
    TVRg: TcxGridDBColumn;
    TVUVisita: TcxGridDBColumn;
    TVEndereco: TcxGridDBColumn;
    TVBairro: TcxGridDBColumn;
    TVCidade: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    TVCEP: TcxGridDBColumn;
    TVNasc: TcxGridDBColumn;
    TVSexo: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    TVemail: TcxGridDBColumn;
    TVIsento: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVTelefone: TcxGridDBColumn;
    TVCodigo: TcxGridDBColumn;
    TVEscola: TcxGridDBColumn;
    TVNickName: TcxGridDBColumn;
    TVDataNasc: TcxGridDBColumn;
    TVCelular: TcxGridDBColumn;
    TVTemDebito: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmTempo: TdxBarSubItem;
    cmPagarDebito: TdxBarLargeButton;
    lbQuant: TLMDLabel;
    lbTotDeb: TLMDLabel;
    cmVenderCred: TdxBarLargeButton;
    pmTempo: TdxBarPopupMenu;
    cmDebTempo: TdxBarLargeButton;
    panMostrar: TPanel;
    cxLabel1: TcxLabel;
    cmMostrar: TcxComboBox;
    cmOrdem: TcxComboBox;
    cxLabel2: TcxLabel;
    lbNumCli: TcxLabel;
    lbDebTotal: TcxLabel;
    lbCredTotal: TcxLabel;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTipoAcessoPref: TIntegerField;
    TVIncluidoEm: TcxGridDBColumn;
    TVIncluidoPor: TcxGridDBColumn;
    TVAlteradoEm: TcxGridDBColumn;
    TVAlteradoPor: TcxGridDBColumn;
    TabIncluidoEm: TDateTimeField;
    cmZerarTempo: TdxBarLargeButton;
    cmSubTempo: TdxBarLargeButton;
    cmSenha: TdxBarLargeButton;
    pmSenha: TdxBarPopupMenu;
    cmAlterarSenha: TdxBarButton;
    cmApagarSenha: TdxBarButton;
    TabPai: TStringField;
    TabMae: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabLimiteDebito: TCurrencyField;
    TabInativo: TBooleanField;
    TVInativo: TcxGridDBColumn;
    TVLimDebito: TcxGridDBColumn;
    TVPai: TcxGridDBColumn;
    TVMae: TcxGridDBColumn;
    TabFoto: TGraphicField;
    TVSenha: TcxGridDBColumn;
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmApagarSenhaClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure cmSenhaClick(Sender: TObject);
    procedure cmSubTempoClick(Sender: TObject);
    procedure cmZerarTempoClick(Sender: TObject);
    procedure cmVenderCredClick(Sender: TObject);
    procedure cmDebTempoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmPagarDebitoClick(Sender: TObject);
    procedure cmOrdemChange(Sender: TObject);
    procedure cmMostrarPropertiesChange(Sender: TObject);
    procedure cmOrdemPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    STotDeb,
    STotCred,
    SQuant : String;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;
    
    
    { Public declarations }
  end;

var
  fbClientes: TfbClientes;

implementation

uses ucmaDM, ufmImagens, ucmaPri, ucmaFrmCredito, cmClassesBase,
  ucmaFrmPass, ucmaFrmCliente, ucmaFrmDeb, cmIDRecursos, ucmaFrmZerarTempo,
  ucmaFrmSenha;

{$R *.dfm}

procedure TfbClientes.FiltraDados;
var 
  FiltroBas : String;
  M, H : Integer;
begin
  if not Tab.Active then Tab.Active := True;

  FiltroBas := '';

  M := Dados.TotalCreditos;
  H := M div 60;
  M := M mod 60;

  STotDeb := 'Débitos = '+FloatToStrF(Dados.TotalDebitos, ffCurrency, 10, 2);
  STotCred := 'Créditos = '+IntToStr(H)+'h '+IntToStr(M)+'m';
  if cmMostrar.ItemIndex=1 then begin
    Tab.IndexName := 'IDebito';
    Tab.SetRange([True], [True]);
    cmOrdem.ItemIndex := 0;
    cmOrdem.Enabled := False;
  end else begin 
    cmOrdem.Enabled := True;
    if cmMostrar.ItemIndex=2 then FiltroBas := '(CreditoM > 1)'; 
    case cmOrdem.ItemIndex of
      0 : begin
        Tab.IndexName := 'INome';
        TVNome.Index := 0;
        TVUsername.Index := 1;
        TVCodigo.Index := 2;
        TV.OptionsBehavior.IncSearchItem := TVNome;
      end;  
      1 : begin
        Tab.IndexName := 'IUsername';
        TVUsername.Index := 0;
        TVNome.Index := 1;
        TVCodigo.Index := 2;
        TV.OptionsBehavior.IncSearchItem := TVUsername;
      end;  
      2 : begin
        Tab.IndexName := 'ICodigo';
        TVCodigo.Index := 0;
        TVNome.Index := 1;
        TVUsername.Index := 2;
        TV.OptionsBehavior.IncSearchItem := TVCodigo;
      end;  
    end;  
  end;
  
  with TV.DataController.Filter do
  if FilterText > '' then begin
    if FiltroBas > '' then
      FiltroBas := '(' + FilterText + ') AND '+ FiltroBas
    else
      FiltroBas := FilterText;
  end;
  Tab.Filter := FiltroBas;
  Tab.Filtered := (FiltroBas>'');

  Tab.Refresh;
  if Tab.RecordCount = 1  then
    SQuant := IntToStr(Tab.RecordCount) + ' Cliente'
  else  
    SQuant := IntToStr(Tab.RecordCount) + ' Cliente(s)';
    
  lbNumCli.Caption := '  '+SQuant+'  ';  
  lbDebTotal.Caption := '  '+STotDeb+'  ';
  lbCredTotal.Caption := '  '+STotCred+'  ';
  TV.DataController.Summary.Recalculate;
end;

procedure TfbClientes.cmVenderCredClick(Sender: TObject);
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

procedure TfbClientes.cmZerarTempoClick(Sender: TObject);
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

procedure TfbClientes.cmDebTempoClick(Sender: TObject);
begin
  inherited;
  if Tab.RecordCount>0 then
    TFrmCredito.Create(Self).Novo(Dados.tbAcesso, TabCodigo.Value, False);
  Tab.Refresh;  
end;

class function TfbClientes.Descricao: String;
begin
  Result := 'Clientes';
end;

procedure TfbClientes.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbClientes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  STotDeb := '';
  STotCred := '';
  SQuant := '';
  cmOrdem.ItemIndex := Dados.tbConfigCampoLocalizaCli.Value;
  cmMostrar.ItemIndex := 0;
end;

procedure TfbClientes.TabCalcFields(DataSet: TDataSet);
begin
  if TabCreditoM.Value > 0 then
    TabCreditoHMS.Value := TicksToHMSSt(TabCreditoM.Value)
  else
    TabCreditoHMS.Clear; 

  if TabTempoTotal.Value > 0 then
    TabTempoTotalHMS.Value := SegundosToHMSSt(TabTempoTotal.Value);
end;

procedure TfbClientes.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with aviewinfo do 
  if (Value<>Null) and (Value>0.009) then begin
    ACanvas.Canvas.Brush.Color := clRed;
    ACanvas.Canvas.Font.Color := clWhite;
  end;
end;

procedure TfbClientes.TVInativoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TfbClientes.TVIsentoCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TfbClientes.cmNovoClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('Codigo', TabCodigo.Value, []);
end;

procedure TfbClientes.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmCliente.Create(Self).Editar(Tab, nil);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('Codigo', TabCodigo.Value, []);
end;

procedure TfbClientes.cmAlterarSenhaClick(Sender: TObject);
var S: String;
begin
  S := TFrmAlteraSenha.Create(Self).Editar(TabSenha.Value, TabNome.Value);
  if S <> TabSenha.Value then begin
    Tab.Edit;
    TabSenha.Value := S;
    Tab.Post;
  end;
end;

procedure TfbClientes.cmApagarClick(Sender: TObject);
var SIndex: String;
begin
  inherited;
  if Dados.CM.Maquinas.PorContato[TabCodigo.Value] <> nil then 
  begin
    Beep;
    ShowMessage('Não é possível apagar um cliente que está com acesso em andamento!');
    Exit;
  end;

  with Dados do begin
    SIndex := tbTran.IndexName;
    try
      tbTran.CancelRange;
      tbTran.IndexName := 'IDebito';
      if tbTran.FindKey([TabCodigo.Value, spDebitado, 0]) then begin
        Beep;
        ShowMessage('Esse cliente possui itens em débito. É necessário fazer o pagamento primeiramente, para depois excluir');
        Exit;
      end;
    finally
      tbTran.IndexName := SIndex;
    end;
  end;      
    
  
  if SimNao('Confirma a exclusão de '+TabNome.Value+' ?') then Tab.Delete;
end;

procedure TfbClientes.cmApagarSenhaClick(Sender: TObject);
begin
  if SimNao('Essa opção deve ser utilizada quando o cliente esquece a senha. '+
            'Dessa forma ele poderá criar uma nova senha. Deseja realmente apagar a senha atual?') then 
  begin
    Tab.Edit;
    TabSenha.Clear;
    Tab.Post;
  end;
end;

procedure TfbClientes.cmPagarDebitoClick(Sender: TObject);
begin
  inherited;
  TFrmDeb.Create(Self).Criar(TabCodigo.Value);
end;

procedure TfbClientes.cmSenhaClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmSenha.ClickItemLink);
  pmSenha.Popup(P.X, P.Y);
end;

procedure TfbClientes.cmSubTempoClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmSubTempo.ClickItemLink);
  pmTempo.Popup(P.X, P.Y);
end;

procedure TfbClientes.AtualizaDireitos;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCliCadastrar);
  cmApagar.Enabled := Permitido(daCliApagar);
  cmDebTempo.Enabled := Permitido(daCliDebitarTempo);
  cmZerarTempo.Enabled := Permitido(daZerarTempoAcumulado);
  cmApagarSenha.Enabled := Permitido(daApagarSenhaCliente);
  TVSenha.Visible := Dados.CM.Config.VerSenhaCli;
  if Tab.Active then Tab.Refresh;
end;

procedure TfbClientes.cmOrdemChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbClientes.cmMostrarPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbClientes.cmOrdemPropertiesChange(Sender: TObject);
begin
  if Tab.Active then 
    FiltraDados;
end;

procedure TfbClientes.ParentChanged;
begin
  inherited;
  panMostrar.Top := 100;
end;

end.
