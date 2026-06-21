unit uCMfbgCaixas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, Db, nxdb, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, dxDBTLCl, dxGrClms, ppCtrls, ppVar, jpeg, ppPrnabl,
  ppClass, ppDB, ppBands, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppReport, ExtCtrls, StdCtrls, Buttons, dxExEdtr;

type
  TfbgCaixas = class(TFrmBaseGrid)
    Tab: TnxTable;
    dsTab: TDataSource;
    TabNumero: TAutoIncField;
    TabAbertura: TDateTimeField;
    TabFechamento: TDateTimeField;
    TabUsuario: TStringField;
    TabDescontos: TCurrencyField;
    TabInternet: TCurrencyField;
    TabSaldoAnt: TCurrencyField;
    TabAberto: TBooleanField;
    GridNumero: TdxDBGridMaskColumn;
    GridAbertura: TdxDBGridDateColumn;
    GridFechamento: TdxDBGridDateColumn;
    GridUsuario: TdxDBGridMaskColumn;
    GridLancExtrasE: TdxDBGridCurrencyColumn;
    GridDescontos: TdxDBGridCurrencyColumn;
    GridInternet: TdxDBGridCurrencyColumn;
    GridVendas: TdxDBGridCurrencyColumn;
    GridSaldoAnt: TdxDBGridCurrencyColumn;
    GridAberto: TdxDBGridCheckColumn;
    tAux: TnxTable;
    tAuxNumero: TAutoIncField;
    tAuxAbertura: TDateTimeField;
    tAuxFechamento: TDateTimeField;
    tAuxUsuario: TStringField;
    tAuxDescontos: TCurrencyField;
    tAuxInternet: TCurrencyField;
    tAuxSaldoAnt: TCurrencyField;
    tAuxAberto: TBooleanField;
    tAuxObs: TMemoField;
    tAuxSaldoFinal: TCurrencyField;
    tAuxVendas: TCurrencyField;
    TabVendas: TCurrencyField;
    TabObs: TMemoField;
    TabSaldoFinal: TCurrencyField;
    GridSaldoFinal: TdxDBGridCurrencyColumn;
    TabPacotes: TCurrencyField;
    tAuxPacotes: TCurrencyField;
    TabSubtotal: TCurrencyField;
    GridSubTotal: TdxDBGridCurrencyColumn;
    TabLancExtrasE: TCurrencyField;
    TabLancExtrasS: TCurrencyField;
    tAuxLancExtrasE: TCurrencyField;
    tAuxLancExtrasS: TCurrencyField;
    GridLancExtrasS: TdxDBGridCurrencyColumn;
    cmImprimeCaixa: TdxBarLargeButton;
    TabAguardandoPagto: TCurrencyField;
    tAuxAguardandoPagto: TCurrencyField;
    procedure tAuxCalcFields(DataSet: TDataSet);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmPeriodoTudoClick(Sender: TObject);
    procedure TabAfterInsert(DataSet: TDataSet);
    procedure cmImprimeCaixaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Retotaliza;
  public
    { Public declarations }
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    procedure FiltraDados; override;
    procedure Editar; override;
    procedure Novo; override;
    procedure Apagar; override;
  end;

var
  fbgCaixas: TfbgCaixas;

implementation

uses uCMDados, uCMFrmPri, uCMFrmCaixa, uCMFrmRepView, cmIDRecursos,
  uCMFrmRel;

{$R *.DFM}

{ TfbgCaixa }

procedure TfbgCaixas.Apagar;
begin
  inherited;

end;

procedure TfbgCaixas.Editar;
begin
  inherited;
  TFrmCaixa.Create(Self).Editar(Tab);
end;

procedure TfbgCaixas.FiltraDados;
begin
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    if Permitido(reCaixas, taCaiVerAntesOutros) then begin
      Tab.IndexName := 'IDia';
      Tab.SetRange([Inicio], [Fim]);
    end else begin
      Tab.IndexName := 'IUsuario';
      Tab.SetRange([Dados.CM.Username, Inicio], [Dados.CM.Username, Fim]);
    end;  

    Tab.Refresh;
    Tab.Filtered := True;
    Tab.Last;

    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbgCaixas.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  tAux.Open;
  Grid.DataSource := nil;
  inherited;
  
  if Permitido(reCaixas, taCaiVerAntesOutros) or Permitido(reCaixas, taCaiVerAntes) then begin
    cm2DiasClick(cm1Semana);
    cmSubPeriodo.Visible := ivAlways;  
  end else begin
    cm2DiasClick(cmHoje);
    cmSubPeriodo.Visible := ivNever;
  end;
end;

procedure TfbgCaixas.Novo;
var 
  Refiltrar: Boolean;
  Hora : TDateTime;
begin
  Refiltrar := False;
  Tab.DisableControls;
  try
    if NumAberto<1 then begin
      Hora := Now;
      if MessageDlg('Confirma abertura do caixa de '+
                    FormatDateTime('dd/mm/yyyy hh:mm', Hora),
                    mtConfirmation,
                    [mbYes, mbNo], 0) = mrNo then Exit;
      tAux.Refresh;
      tAux.Last;
                      
      Tab.Insert;
      TabAberto.Value := True;
      TabAbertura.Value := Hora;
      TabUsuario.Value := Dados.CM.Username;
      
      if tAux.RecordCount > 0 then
        TabSaldoAnt.Value := tAuxSaldoFinal.Value
      else
        TabSaldoAnt.Value := 0;  
      Tab.Post;  
      DiaAberto := Hora;
      NumAberto := TabNumero.Value;
    end else begin
      Refiltrar := True;
      Tab.IndexName := 'INumero';
      if not Tab.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Falha localizando caixa aberto!');
        exit;
      end;
        
      if Now < TabAbertura.Value then begin
        Beep;
        ShowMessage('Data ou Hora de fechamento anterior a abertura!');
        Exit;
      end;
        
      if MessageDlg('Confirma Fechamento do caixa de '+
                    FormatDateTime('dd/mm/yyyy', TabAbertura.Value),
                    mtConfirmation,
                    [mbYes, mbNo], 0) = mrNo then Exit;
                    
      Tab.Edit;
      TabAberto.Value := False;
      TabFechamento.Value := Now;
      Tab.Post;  
      
      DiaAberto := 0;
      NumAberto := -1;
    end;
  finally
    Tab.EnableControls;
    if Refiltrar then FiltraDados;
  end;   
end;

procedure TfbgCaixas.tAuxCalcFields(DataSet: TDataSet);
begin
  tAuxSaldoFinal.Value :=
    (tAuxSaldoAnt.Value +
     tAuxLancExtrasE.Value +
     tAuxInternet.Value +
     tAuxPacotes.Value +
     tAuxVendas.Value) - 
     tAuxLancExtrasS.Value;
end;

procedure TfbgCaixas.TabCalcFields(DataSet: TDataSet);
begin
  TabSubtotal.Value :=  
    TabLancExtrasE.Value +
    TabInternet.Value +
    TabPacotes.Value + 
    TabVendas.Value;

  TabSaldoFinal.Value := 
    (TabSaldoAnt.Value +
     TabLancExtrasE.Value +
     TabInternet.Value +
     TabPacotes.Value +
     TabVendas.Value) - 
     TabLancExtrasS.Value;
end;

procedure TfbgCaixas.Retotaliza;
var 
  SAnt : Extended;
begin
  with Dados do 
  if tAux.Findkey([TabNumero.Value]) then begin
    DB.StartTransactionWith([Tab, tAux]);
    try
      SAnt := tAuxSaldoAnt.Value;
      while not tAux.Eof do begin
        tAux.Edit;
        if tAuxLancExtrasS.Value < 0 then
          tAuxLancExtrasS.Value := tAuxLancExtrasS.Value * -1;
        tAuxSaldoAnt.Value := SAnt;
        tAux.Post;
        SAnt := tAuxSaldoFinal.Value;
        tAux.Next;
      end;
      DB.Commit;
      Tab.Refresh;
    except
      tAux.Cancel;
      DB.Rollback;
    end;
  end;  
end;

procedure TfbgCaixas.cmPeriodoTudoClick(Sender: TObject);
begin
  inherited cmPeriodoTudoClick(Sender);
end;

procedure TfbgCaixas.TabAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TabLancExtrasS.Value := 0;
  TabLancExtrasE.Value := 0;
  TabVendas.Value := 0;
  TabInternet.Value := 0;
end;

procedure TfbgCaixas.cmImprimeCaixaClick(Sender: TObject);
begin
  TFrmRel.Create(nil).RelCaixa(TabNumero.AsInteger);
end;

end.
