unit ucmafbTran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData, cmClassesBase,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxTextEdit, cxTimeEdit, cxCalendar, cxImageComboBox,
  cxDBLookupComboBox, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, nxdb, cxCheckBox, dxBarExtItems, cxContainer,
  cxLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxSplitter, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbTran = class(TFrmBase)
    Timer2: TTimer;
    Timer1: TTimer;
    Tab: TnxTable;
    TabData: TDateTimeField;
    TabValorFinal: TCurrencyField;
    TabNomeTipoAcesso: TStringField;
    TabNumero: TAutoIncField;
    TabCaixaI: TIntegerField;
    TabCaixaF: TIntegerField;
    TabCaixaP: TIntegerField;
    TabTipoAcesso: TWordField;
    TabInicio: TDateTimeField;
    TabFim: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabContato: TIntegerField;
    TabNome: TStringField;
    TabMaquina: TWordField;
    TabTipo: TWordField;
    TabFuncI: TStringField;
    TabFuncF: TStringField;
    TabTempo: TDateTimeField;
    TabTempoCobrado: TDateTimeField;
    TabCredUsado: TIntegerField;
    TabCredAnterior: TIntegerField;
    TabDesconto: TCurrencyField;
    TabProdutos: TCurrencyField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    TabIsento: TBooleanField;
    TabNaoUsarPacote: TBooleanField;
    TabCodPacote: TWordField;
    TabSinal: TCurrencyField;
    TabTransacaoVinculada: TIntegerField;
    TabValorFinalAcesso: TCurrencyField;
    TabDescontoProduto: TCurrencyField;
    TabNumDoc: TStringField;
    TabStatusPagto: TWordField;
    TabObsSt: TStringField;
    TabNomeFuncI: TStringField;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVMaquina: TcxGridDBColumn;
    TVData: TcxGridDBColumn;
    TVInicio: TcxGridDBColumn;
    TVTempo: TcxGridDBColumn;
    TVTipo: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVValorFinal: TcxGridDBColumn;
    TVStatusPagto: TcxGridDBColumn;
    TVTipoAcesso: TcxGridDBColumn;
    TVFim: TcxGridDBColumn;
    TVDesconto: TcxGridDBColumn;
    TVDescontoProduto: TcxGridDBColumn;
    TVObsSt: TcxGridDBColumn;
    TVNomeFuncI: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmMostrar: TdxBarCombo;
    cmCaixa: TdxBarLargeButton;
    cmFiltroTipo: TdxBarLargeButton;
    gridAP: TcxGrid;
    tvAP: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    glAP: TcxGridLevel;
    splitAP: TcxSplitter;
    tAP: TnxTable;
    dsAP: TDataSource;
    tAPData: TDateTimeField;
    tAPValorFinal: TCurrencyField;
    tAPNomeTipoAcesso: TStringField;
    tAPNumero: TAutoIncField;
    tAPCaixaI: TIntegerField;
    tAPCaixaF: TIntegerField;
    tAPCaixaP: TIntegerField;
    tAPTipoAcesso: TWordField;
    tAPInicio: TDateTimeField;
    tAPFim: TDateTimeField;
    tAPDataPagto: TDateTimeField;
    tAPContato: TIntegerField;
    tAPNome: TStringField;
    tAPMaquina: TWordField;
    tAPTipo: TWordField;
    tAPFuncI: TStringField;
    tAPFuncF: TStringField;
    tAPTempo: TDateTimeField;
    tAPTempoCobrado: TDateTimeField;
    tAPCredUsado: TIntegerField;
    tAPCredAnterior: TIntegerField;
    tAPDesconto: TCurrencyField;
    tAPProdutos: TCurrencyField;
    tAPValor: TCurrencyField;
    tAPObs: TMemoField;
    tAPIsento: TBooleanField;
    tAPNaoUsarPacote: TBooleanField;
    tAPCodPacote: TWordField;
    tAPSinal: TCurrencyField;
    tAPTransacaoVinculada: TIntegerField;
    tAPValorFinalAcesso: TCurrencyField;
    tAPDescontoProduto: TCurrencyField;
    tAPNumDoc: TStringField;
    tAPStatusPagto: TWordField;
    tAPObsSt: TStringField;
    tAPNomeFuncI: TStringField;
    cmVerFechar: TdxBarButton;
    cmSuprimento: TdxBarButton;
    cmSangria: TdxBarButton;
    pmCaixa: TdxBarPopupMenu;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmFiltroTipoClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVValorFinalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmMostrarChange(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure cmAguardaPagtoClick(Sender: TObject);
    procedure tAPCalcFields(DataSet: TDataSet);
    procedure tvAPDblClick(Sender: TObject);
    procedure cmVerFecharClick(Sender: TObject);
    procedure cmCaixaClick(Sender: TObject);
    procedure cmSuprimentoClick(Sender: TObject);
    procedure cmSangriaClick(Sender: TObject);
  private
    Tipos : TArrayTipoTran;
    NAAoFiltrar: Integer;
    PrimeiroFiltro: Boolean;
    { Private declarations }
  public
    FiltroF : Variant;
    procedure AtualizaDireitos; override;
    procedure EditaTran(ATab: TnxTable);
    procedure NenhumTipo;
    procedure FiltraDados; override;
    procedure Refresh;
    procedure AjustaVisAP;
    class function Descricao: String; override;
    { Public declarations }
  end;

const
  ftran_Nenhum    = 0;
  ftran_Cliente   = 1;
  ftran_Caixa     = 2;
  ftran_CliDeb    = 3;

var
  fbTran: TfbTran;

implementation

uses ucmafbMaquinas, ucmaFrmTipos, ucmaDM, ucmaPri, ucmaFrmAcesso,
  ucmaFrmCredito, ucmaFrmVendaPac, ucmaFrmDeb, ucmaFrmCaixa, ucmafbCaixa,
  ucmaLancExtra, ucmaFrmVendaPass, ucmaFrmME, cmIDRecursos;

{$R *.dfm}

{ TfbTran }

class function TfbTran.Descricao: String;
begin
  Result := 'Transações';
end;

procedure TfbTran.FiltraDados;
var
  S: String;
  I: Integer;
  Filtrar : Boolean;
begin
  Tab.DisableControls;
  try      
    NAAoFiltrar := NumAberto;
    if not Tab.Active then Tab.Open;
    Tab.Filtered := False;
    with Dados do 
    TVTipoAcesso.Visible := CM.Config.VariosTiposAcesso and (tbTipoAcesso.RecordCount>1);
    TVTipoAcesso.Hidden := not TVTipoAcesso.Visible;

    case Operacao of
      ftran_Cliente : begin
        if PrimeiroFiltro then begin
          cmPeriodo.Caption := 'Período: Hoje';
          DataI := Date;
          DataF := DataI + 0.999999999;
          cmPeriodo.Caption := 'Período: Hoje';
        end;
        PrimeiroFiltro := False;
        
        Tab.IndexName := 'IContato';
        Tab.SetRange([Filtro, DataI], [Filtro, DataF]);
        Tab.Last;
        TVNome.Visible := False;
        TVNome.Hidden := True;
        cmPeriodo.Visible := ivAlways;
        cmFiltroTipo.Visible := ivAlways;
        cmCaixa.Visible := ivNever;
        tAP.Active := False;
        AjustaVisAP;
        TV.OptionsView.GroupByBox := False;
      end;
      
      ftran_CliDeb : begin
        Tab.IndexName := 'IDebito';
        Tab.SetRange([Filtro, spDebitado, 0], [Filtro, spDebitado, 0]);
        cmPeriodo.Visible := ivNever;
        cmLayout.Visible := ivNever;
        cmExportar.PaintStyle := psCaptionGlyph;
        cmAtualizar.Visible := ivNever;
        cmCaixa.Visible := ivNever;
        cmFiltroTipo.Visible := ivAlways;
        tAP.Active := False;
      end;

      ftran_Caixa : begin
        Tab.IndexName := 'ICaixaF';
        if FiltroF<>null then
          Tab.SetRange([Filtro], [FiltroF])
        else  
          Tab.SetRange([Filtro], [Filtro]);
        Tab.First;
        cmPeriodo.Visible := ivNever;
        cmLayout.Visible := ivNever;
        cmExportar.PaintStyle := psCaptionGlyph;
        cmAtualizar.Visible := ivNever;
        cmCaixa.Visible := ivNever;
        cmFiltroTipo.Visible := ivAlways;
        if FiltroF<>null then begin
          tAP.Active := True;
          tAP.IndexName := 'IPagto';
          tAP.SetRange([spAguardaPagto], [spAguardaPagto]);
          tAP.Refresh;
        end else  
          tAp.Active := False;
          
        AjustaVisAP;
      end
    else
      begin
        cmPeriodo.Visible := ivNever;
        cmLayout.Visible := ivAlways;

        tAP.Active := True;
        tAP.IndexName := 'IPagto';
        tAP.SetRange([spAguardaPagto], [spAguardaPagto]);
        tAP.Refresh;
        AjustaVisAP;
        Tab.IndexName := 'ICaixaF';
        Tab.SetRange([NumAberto], [NumAberto]);
      end;  
    end;

    Filtrar := False;
    for I := ttAcesso to ttVendaPassaporte do
    if Tipos[I] then 
      Filtrar := True;

    S := '';
    if Filtrar then begin
      for I := 0 to ttVendaPassaporte do
      if Tipos[I] then 
        if S>'' then
          S := S + ' OR (Tipo=' + IntToStr(I) +') '
        else
          S := ' (Tipo=' + IntToStr(I) +') ';
      if TV.DataController.Filter.FilterText>'' then begin
        if S>'' then S := '('+S+') AND ';
        S := S+'('+TV.DataController.Filter.FilterText+')';
      end;
      Tab.Filter := S;
    end else
      Tab.Filter := TV.DataController.Filter.FilterText;
    Tab.Filtered := (Tab.Filter>'');
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbTran.NenhumTipo;
var I : Integer;
begin
  for I := 0 to ttSangriaCaixa do
    Tipos[I] := False;
end;

procedure TfbTran.FrmBasePaiCreate(Sender: TObject);
begin
  PrimeiroFiltro := True;
  FiltroF := Null;
  inherited;
  NenhumTipo;
end;

procedure TfbTran.cmFiltroTipoClick(Sender: TObject);
begin
  inherited;
  TFrmTipos.Create(Self).Selecionar(@Tipos);
  FiltraDados;
end;

procedure TfbTran.TabCalcFields(DataSet: TDataSet);
var S : String;
begin
  S := TabObs.Value;
  if Pos(#13, S) > 0 then
    S := Copy(S, 1, Pos(#13, S)-1);
  TabObsSt.Value := S;
  TabData.Value := TabInicio.Value;
  if TabTipo.Value in [ttSuprimentoCaixa, ttSangriaCaixa] then
    TabValorFinal.Value := TabValor.Value
  else
    TabValorFinal.Value := TabProdutos.Value + TabValorFinalAcesso.Value;
end;

procedure TfbTran.TVValorFinalGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if (AText='R$ 0') or (AText='R$ 0,00') then AText := '';
end;

procedure TfbTran.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;


procedure TfbTran.TVDblClick(Sender: TObject);
begin
  EditaTran(Tab);
end;

procedure TfbTran.cmAguardaPagtoClick(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfbTran.tAPCalcFields(DataSet: TDataSet);
var S : String;
begin
  S := tAPObs.Value;
  if Pos(#13, S) > 0 then
    S := Copy(S, 1, Pos(#13, S)-1);
  tAPObsSt.Value := S;
  tAPData.Value := tAPInicio.Value;
  if tAPTipo.Value in [ttSuprimentoCaixa, ttSangriaCaixa] then
    tAPValorFinal.Value := tAPValor.Value
  else
    tAPValorFinal.Value := tAPProdutos.Value + tAPValorFinalAcesso.Value;     
end;

procedure TfbTran.EditaTran(ATab: TnxTable);
begin
  if ATab.IsEmpty then Exit;
  case ATab.FieldByName('Tipo').AsInteger of 
    ttAcesso,
    ttManutencao,
    ttAcessoVenda : TFrmAcesso.Create(Self).Editar(ATab, 2);
    ttVendaPacote : TFrmVendaPac.Create(Self).Editar(ATab);
    ttVendaPassaporte : TFrmVendaPass.Create(Self).Editar(Tab); 
    ttCreditoTempo : TFrmCredito.Create(Self).Editar(ATab);    
    ttSangriaCaixa,
    ttSuprimentoCaixa : TFrmLancExtra.Create(Self).Editar(Tab);
    ttEstVenda,
    ttEstCompra,
    ttEstEntrada,
    ttEstSaida    : TFrmME.Create(Self).Editar(Tab);
    ttPagtoDebito : TFrmDeb.Create(Self).Editar(ATab.FieldByName('Numero').AsInteger); 
    ttSinal :
    if Dados.tbAcesso.Locate('Numero', ATab.FieldByName('TransacaoVinculada').AsInteger, []) then
      TFrmAcesso.Create(Self).Editar(Dados.tbAcesso, 0);
  end;
  if tAP.Active then
    tAP.Refresh;
  Tab.Refresh;
  AjustaVisAP;
end;

procedure TfbTran.tvAPDblClick(Sender: TObject);
begin
  EditaTran(tAP);
end;

procedure TfbTran.AjustaVisAP;
begin
  gridAP.Visible := tAP.Active and (not tAP.IsEmpty);
  splitAP.Visible := gridAP.Visible;
end;

procedure TfbTran.Refresh;
begin
  if Tab.Active then begin
    Tab.Refresh;
    if tAP.Active then tAP.Refresh;
    AjustaVisAP;  
  end;  
end;

procedure TfbTran.cmVerFecharClick(Sender: TObject);
var 
  FI : PfmFormInfo;
begin
  with Dados do begin
    if tbCaixa.Locate('Numero', NumAberto, []) then
      TFrmCaixa.Create(Self).Editar(tbCaixa);
    if NumAberto<0 then begin
      FI := FrmPri.FM.FormByClass(TfbCaixa);
      if FI^.fiInstance<>nil then
        FI^.fiInstance.FiltraDados;
    end;    
  end;    
end;

procedure TfbTran.cmCaixaClick(Sender: TObject);
var P: TPoint;
begin
  P := ItemLinkScreenPoint(cmCaixa.ClickItemLink);
  pmCaixa.Popup(P.X, P.Y);
end;

procedure TfbTran.AtualizaDireitos;
begin
  inherited;
  cmVerFechar.Enabled := Permitido(daCaiAbrirFechar) or Permitido(daCaiVerAtual);
  cmSuprimento.Enabled := Permitido(daCaiSuprimento);
  cmSangria.Enabled := Permitido(daCaiSangria);
  cmExportar.Enabled := Permitido(daCaiVerAtual);
  if NAAoFiltrar = NumAberto then
    Tab.Refresh
  else
    FiltraDados;  
end;

procedure TfbTran.cmSuprimentoClick(Sender: TObject);
begin
  TFrmLancExtra.Create(Self).Novo(Tab, ttSuprimentoCaixa);
end;

procedure TfbTran.cmSangriaClick(Sender: TObject);
begin
  TFrmLancExtra.Create(Self).Novo(Tab, ttSangriaCaixa);
end;

end.






               