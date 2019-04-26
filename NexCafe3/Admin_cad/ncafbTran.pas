unit ncafbTran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData, ncClassesBase,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxTextEdit, cxTimeEdit, cxCalendar, cxImageComboBox,
  cxDBLookupComboBox, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, nxdb, cxCheckBox, dxBarExtItems, cxContainer,
  cxLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxSplitter, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxMemo, 
  ncSessao, 
  ncDebito,
  ncMovEst,
  ncLancExtra, 
  ncImpressao,
  ncCredTempo, dxPScxCommon, dxPScxGrid6Lnk;

type
  TfbTran = class(TFrmBase)
    Timer2: TTimer;
    Timer1: TTimer;
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVMaquina: TcxGridDBColumn;
    TVData: TcxGridDBColumn;
    TVInicio: TcxGridDBColumn;
    TVTipo: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVTotal: TcxGridDBColumn;
    TVDesconto: TcxGridDBColumn;
    TVNomeFuncI: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmMostrar: TdxBarCombo;
    cmCaixa: TdxBarLargeButton;
    cmFiltroTipo: TdxBarLargeButton;
    gridAP: TcxGrid;
    tvAP: TcxGridDBTableView;
    glAP: TcxGridLevel;
    splitAP: TcxSplitter;
    tAP: TnxTable;
    dsAP: TDataSource;
    tvAPInicio: TcxGridDBColumn;
    tvAPTermino: TcxGridDBColumn;
    tvAPMinutosR: TcxGridDBColumn;
    tvAPMaq: TcxGridDBColumn;
    tvAPNomeCliente: TcxGridDBColumn;
    TabID: TAutoIncField;
    TabDataHora: TDateTimeField;
    TabCliente: TIntegerField;
    TabFunc: TStringField;
    TabTotal: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabPago: TCurrencyField;
    TabObs: TMemoField;
    TabCancelado: TBooleanField;
    TabCanceladoPor: TStringField;
    TabCanceladoEm: TDateTimeField;
    TabCaixa: TIntegerField;
    TabMaq: TWordField;
    TabTotalFinal: TCurrencyField;
    TVObs: TcxGridDBColumn;
    TVTotalFinal: TcxGridDBColumn;
    TVPago: TcxGridDBColumn;
    TabNomeCliente: TStringField;
    cmFechar: TdxBarLargeButton;
    cmSuprimento: TdxBarLargeButton;
    cmSangria: TdxBarLargeButton;
    TabTipo: TWordField;
    TVDescr: TcxGridDBColumn;
    TabSessao: TIntegerField;
    TabDescr: TStringField;
    tAPID: TAutoIncField;
    tAPInicio: TDateTimeField;
    tAPTermino: TDateTimeField;
    tAPMinutosR: TFloatField;
    tAPMinutosC: TFloatField;
    tAPMaq: TWordField;
    tAPEncerrou: TBooleanField;
    tAPCliente: TIntegerField;
    tAPTransfMaq: TBooleanField;
    tAPTipoCli: TWordField;
    tAPCancelado: TBooleanField;
    tAPTotal: TCurrencyField;
    tAPDesconto: TCurrencyField;
    tAPPago: TCurrencyField;
    tAPNomeCliente: TStringField;
    tAPFuncI: TStringField;
    tAPFuncF: TStringField;
    tAPObs: TMemoField;
    tAPTipoAcesso: TIntegerField;
    tAPCaixaI: TIntegerField;
    tAPCaixaF: TIntegerField;
    tAPTicksI: TIntegerField;
    tAPPausado: TBooleanField;
    tAPInicioPausa: TIntegerField;
    tAPMinTicksUsados: TIntegerField;
    tAPMinTicksTotal: TIntegerField;
    tAPFimTicksUsados: TIntegerField;
    tAPStrPausas: TMemoField;
    tAPMinutosCli: TFloatField;
    tAPMinutosPrev: TFloatField;
    tAPMinutosMax: TFloatField;
    tAPMinutosCliU: TFloatField;
    tAPValorCli: TCurrencyField;
    tAPValorCliU: TFloatField;
    tAPTranI: TIntegerField;
    tAPTranF: TIntegerField;
    TVSessao: TcxGridDBColumn;
    cmCancelar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    TVCancelado: TcxGridDBColumn;
    TVCanceladoPor: TcxGridDBColumn;
    TVCanceladoEm: TcxGridDBColumn;
    cxStyle2: TcxStyle;
    TVID: TcxGridDBColumn;
    TabDebito: TCurrencyField;
    TVDebito: TcxGridDBColumn;
    cmRecibo: TdxBarLargeButton;
    TabQtdTempo: TFloatField;
    cmCorrigeDataCaixa: TdxBarLargeButton;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmFiltroTipoClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmAguardaPagtoClick(Sender: TObject);
    procedure tvAPDblClick(Sender: TObject);
    procedure cmVerFecharClick(Sender: TObject);
    procedure cmSuprimentoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure TVStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure TVTipoStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmFecharClick(Sender: TObject);
    procedure cmReciboClick(Sender: TObject);
    procedure cmCorrigeDataCaixaClick(Sender: TObject);
    procedure cmExportarClick(Sender: TObject);
  private
    Tipos : TArrayTipoTran;
    NAAoFiltrar: Integer;
    PrimeiroFiltro: Boolean;
    procedure _EditarSessao(aID: Integer);
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

var
  fbTran: TfbTran;

implementation

uses 
  ncafbMaquinas, 
  ncaFrmTipos, 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmCaixa, 
  ncafbCaixa,
  ncaFrmLancExtra, 
  ncIDRecursos, ncDMServ, ncaFrmTempo, ncaFrmDebito, ncaFrmImp, ncDMCaixa,
  ncaDMComp, ncDebTempo, ncaFrmDebTempo, ncaFrmCorrigeDataCaixa;

{$R *.dfm}

{ TfbTran }

class function TfbTran.Descricao: String;
begin
  Result := 'Transações';
end;

procedure TfbTran.cmReciboClick(Sender: TObject);
begin
  inherited;
  dmComp.Imprime(TabID.Value);
end;

procedure TfbTran.cmFecharClick(Sender: TObject);
var NC: Integer;
begin
  NC := NumAberto;
  if SimNao('Deseja realmente fechar o caixa atual?') then begin
    Dados.CM.FecharCaixa(NC);
    if gConfig.RelCaixaAuto then begin
      Dados.tbCaixa.Refresh;
      if Dados.tbCaixa.Locate('ID', NC, []) and (not Dados.tbCaixaAberto.Value) then begin
        Application.CreateForm(TdmCaixa, dmCaixa);
        try
          TFrmCaixa.Create(nil).Editar(Dados.tbCaixa, True);
        finally
          dmCaixa.Free;  
        end;
      end;
    end;
  end;
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

    case Operacao of
      ftran_Cliente : begin
        if PrimeiroFiltro then begin
          cmPeriodo.Caption := 'Período: Hoje';
          DataI := Date;
          DataF := DataI + 0.999999999;
          cmPeriodo.Caption := 'Período: Hoje';
        end;
        PrimeiroFiltro := False;

        Tab.IndexName := 'ICliDH';
        Tab.SetRange([Filtro, DataI], [Filtro, DataF]);
        Tab.Last;
        TVNome.Visible := False;
        TVNome.Hidden := True;
        cmPeriodo.Visible := ivAlways;
        cmFiltroTipo.Visible := ivAlways;
        cmCaixa.Visible := ivNever;
        cmCorrigeDataCaixa.Visible := ivNever;
        cmSuprimento.Visible := ivNever;
        cmFechar.Visible := ivNever;
        cmSangria.Visible := ivNever;
        tAP.Active := False;
        AjustaVisAP;
        TV.OptionsView.GroupByBox := False;
      end;
      
      ftran_Caixa : begin
        Tab.IndexName := 'ICaixaID';
        if FiltroF<>null then
          Tab.SetRange([Filtro], [FiltroF]) else
          Tab.SetRange([Filtro], [Filtro]);
        Tab.First;
        cmPeriodo.Visible := ivNever;
        cmLayout.Visible := ivNever;
        cmExportar.PaintStyle := psCaptionGlyph;
        cmAtualizar.Visible := ivNever;
        cmCaixa.Visible := ivNever;
        cmSuprimento.Visible := ivNever;
        cmCorrigeDataCaixa.Visible := ivNever;
        cmFechar.Visible := ivNever;
        cmSangria.Visible := ivNever;
        cmFiltroTipo.Visible := ivAlways;
        if FiltroF=Null then begin
          tAP.Active := True;
          tAP.SetRange([True, 0], [True, 0]);
        end else
          tAP.Active := False;
        AjustaVisAP;
      end
    else
      begin
        cmPeriodo.Visible := ivNever;
        cmLayout.Visible := ivAlways;

        tAP.Active := True;
        tAP.SetRange([True, 0], [True, 0]);
        tAP.Refresh;
        AjustaVisAP;
        Tab.IndexName := 'ICaixaID';
        Tab.SetRange([NumAberto], [NumAberto]);
      end;  
    end;

    Filtrar := False;
    for I := trInicioSessao to trCaixaSai do 
    if Tipos[I] then 
      Filtrar := True;

    S := '';
    if Filtrar then begin
      for I := 0 to trCaixaSai do 
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
  for I := 0 to trCaixaSai do 
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
begin
  TabTotalFinal.Value := TabTotal.Value - TabDesconto.Value;
end;

procedure TfbTran.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with AViewInfo do 
  if (VarIsFloat(Value)) and (Value>0.009) then begin
    ACanvas.Brush.Color := clRed;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure TfbTran.TVStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  out AStyle: TcxStyle);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVCancelado.Index];
  if VarIsType(V, varBoolean) and (V=True) then 
  if (AItem=TVTotal) or (AItem=TVDesconto) or (AItem=TVPago) or (AItem=TVTotalFinal) then
    AStyle := cxStyle2 else
    AStyle := cxStyle1;
end;
procedure TfbTran.TVTipoStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  out AStyle: TcxStyle);
var V: Variant;  
begin
  V := ARecord.Values[TVTipo.Index];
  if VarIsType(V, varBoolean) and (V=True) then
    AStyle := cxStyle2;
end;

procedure TfbTran.TVTotalGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if (AText='R$ 0') or (AText='R$ 0,00') then AText := '';
end;

procedure TfbTran._EditarSessao(aID: Integer);
var S: TncSessao;
begin
  S := Dados.CM.Sessoes.PorID[aID];
  if S<>nil then 
    Dados.EditarSessao(S)
  else with DM do begin
    S := TncSessao.Create(True);
    try
      if not tSessao.FindKey([aID]) then Exit;
      S.LeDataset(tSessao);
      RefreshSessao(S);
      Dados.EditarSessao(S);
    finally
      S.Free;
    end;
  end;
end;

procedure TfbTran.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbTran.cmAguardaPagtoClick(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfbTran.cmCancelarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;
  if TabTipo.Value=trCorrDataCx then Exit;
  if SimNao('Deseja realmente cancelar a transação selecionada?') then
  begin
    Dados.CM.CancelaTran(TabID.Value, Dados.CM.Username);
    Tab.Refresh;
  end;
end;

procedure TfbTran.cmCorrigeDataCaixaClick(Sender: TObject);
var A, F: TDateTime;
begin
  inherited;
  A := DiaAberto;
  F := 0;
  if TFrmCorrigeDataCaixa.Create(nil).Editar(NumAberto, A, F) then begin
    Dados.CM.CorrigeDataCaixa(NumAberto, A, 0);
    DiaAberto := A;
  end;
end;

procedure TfbTran.cmEditarClick(Sender: TObject);
var 
  ME: TncMovEst;
  CT, CTb : TncCredTempo;
  DT : TDadosTempo;
  Deb : TncDebito;
  Imp, Ant : TncImpressao;
  LE : TncLancExtra;
  T : TncDebTempo;
  Tempo : Double;
  Obs: String; 
begin
  case TabTipo.Value of
    trDebTempo : begin
      T := TncDebTempo.Create;
      try
        T.LeDataset(Tab);
        Tempo := T.QtdTempo;
        Obs := T.Obs;
        if TFrmDebTempo.Create(nil).Editar((TabCaixa.Value=NumAberto) and (not TabCancelado.Value), 
                                           TabNomeCliente.Value, Tempo, Obs) then 
        begin
          T.QtdTempo := Tempo;
          T.Obs := Obs;
          Dados.CM.SalvaDebTempo(T);
        end;
      finally
        T.Free;
      end;
    end;
    trImpressao : with Dados do 
    if tbImp.Locate('Tran', TabID.Value, []) then begin
      Imp := TncImpressao.Create;
      Ant := TncImpressao.Create;
      try
        Imp.LoadFromDataset(tbImp);
        Ant.AssignFrom(Imp);
        if TFrmImp.Create(nil).Editar(False, (Imp.impCaixa=NumAberto), Imp) and (not Imp.Igual(Ant)) then
        begin
          Imp._Operacao := osAlterar;
          Dados.CM.SalvaImpressao(Imp);
        end;
      finally
        Imp.Free;
        Ant.Free;
      end;
    end;

    trCaixaEnt..trCaixaSai : 
    begin
      LE := TncLancExtra.Create;
      try
        LE.LeDataset(Tab);
        if TFrmLancExtra.Create(nil).Editar((LE.Caixa=NumAberto), LE) then
          Dados.CM.SalvaLancExtra(LE);
      finally
        LE.Free;
      end;
    end;
    
    trEstVenda..trEstSaida :
    begin
      ME := TncMovEst.Create;
      try
        ME.LeDataset(Tab);
        DM.LoadIMEs(ME);
        Dados.EditarMovEst(ME);
      finally
        ME.Free;
      end;
    end;
    
    trInicioSessao,
    trFimSessao : _EditarSessao(TabSessao.Value);

    trCredTempo : 
    if not Dados.tbTempo.Locate('Tran', TabID.Value, []) then
      raise Exception.Create('Registro não encontrado') else
    begin  
      CT := TncCredTempo.Create;
      CTb := TncCredTempo.Create;
      try
        CT.LoadFromDataset(Dados.tbTempo);
        CTb.AssignFrom(CT);
        DT.LoadFromCredTempo(CT);
        if TFrmTempo.Create(nil).Editar(False, (NumAberto=CT.teCaixa), @DT, TabID.Value) then
        begin
          DT.SaveToCredTempo(CT);
          if not CT.Igual(CTb) then begin
            CT._Operacao := osAlterar;
            Dados.CM.SalvaCredTempo(CT);
          end;
        end;
      finally
        CT.Free;
        CTb.Free;
      end;
    end;

    trPagDebito : begin
      Deb := TncDebito.Create;
      try
        Deb.LeDataset(Tab);
        DM.LoadIDebPagos(Deb);
        TFrmDebito.Create(nil).Editar(False, Deb, TabNomeCliente.Value);
      finally
        Deb.Free;
      end;
    end;
    
  end;

  Tab.Refresh;

end;

procedure TfbTran.cmExportarClick(Sender: TObject);
begin
  TV.Preview.Column := nil;
  try
    inherited;
  finally
    TV.Preview.Column := TVObs;
  end;
end;

procedure TfbTran.EditaTran(ATab: TnxTable);
begin
  if ATab.IsEmpty then Exit;                  
{ case ATab.FieldByName('Tipo').AsInteger of 
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
  end;}
  if tAP.Active then
    tAP.Refresh;
  Tab.Refresh;
  AjustaVisAP;
end;

procedure TfbTran.tvAPDblClick(Sender: TObject);
begin
  _EditarSessao(tAPID.Value);
  tAP.Refresh;
  Tab.Refresh;
  AjustaVisAP;
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
begin
  Application.CreateForm(TdmCaixa, dmCaixa);
  with Dados do
  try
    if not tbCaixa.Locate('ID', NumAberto, []) then
      Raise Exception.Create('Caixa atual não encontrado');
    TFrmCaixa.Create(nil).Editar(tbCaixa);
  finally
    dmCaixa.Free;  
  end;    
end;

procedure TfbTran.AtualizaDireitos;
begin
  inherited;
  cmFechar.Enabled := Permitido(daCaiAbrirFechar) or Permitido(daCaiVerAtual);
  cmCancelar.Enabled := Permitido(daTraCancelar);
  cmSuprimento.Enabled := Permitido(daCaiSuprimento);
  cmSangria.Enabled := Permitido(daCaiSangria);
  if NAAoFiltrar = NumAberto then
    Tab.Refresh
  else
    FiltraDados;  
end;

procedure TfbTran.cmSuprimentoClick(Sender: TObject);
var LE: TncLancExtra;
begin
  LE := TncLancExtra.Create;
  try
    if Sender=cmSuprimento then
      LE.Tipo := trCaixaEnt else
      LE.Tipo := trCaixaSai;
    LE.Func := Dados.CM.Username;
    if TFrmLancExtra.Create(nil).Editar(True, LE) then
      Dados.CM.SalvaLancExtra(LE);
    Tab.Refresh;  
  finally
    LE.Free;
  end;
end;

end.






               