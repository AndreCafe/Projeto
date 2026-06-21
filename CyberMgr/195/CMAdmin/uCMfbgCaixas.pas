unit uCMfbgCaixas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, Db, nxdb, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, dxDBTLCl, dxGrClms, jpeg,
  ExtCtrls, StdCtrls, Buttons, dxExEdtr, Menus, am2000menuitem,
  am2000utils, am2000popupmenu, am2000, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  am2000mainmenu;

type
  TfbgCaixas = class(TFrmBaseGrid)
    Tab: TnxTable;
    dsTab: TDataSource;
    TabNumero: TAutoIncField;
    TabAberto: TBooleanField;
    TabUsuario: TStringField;
    TabAbertura: TDateTimeField;
    TabFechamento: TDateTimeField;
    TabAcesso: TCurrencyField;
    TabAcessoNaoPago: TCurrencyField;
    TabAcessoDebPago: TCurrencyField;
    TabAcessoQuant: TCurrencyField;
    TabVenda: TCurrencyField;
    TabVendaNaoPago: TCurrencyField;
    TabVendaDebPago: TCurrencyField;
    TabVendaQuant: TCurrencyField;
    TabSuprimento: TCurrencyField;
    TabSangria: TCurrencyField;
    TabSaldoAnt: TCurrencyField;
    TabDescontos: TCurrencyField;
    TabTempoAcesso: TFloatField;
    TabTempoManutencao: TFloatField;
    TabTotal: TFloatField;
    TabSaldoFinal: TFloatField;
    TabObs: TMemoField;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmPeriodoTudoClick(Sender: TObject);
    procedure GridTotalCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
  private
    { Private declarations }
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

uses uCMDados, uCMFrmPri, uCMFrmCaixa, cmIDRecursos;

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
  inherited;
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    if Permitido(daCaiVerAntesOutros) then begin
      Tab.IndexName := 'IAbertura';
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
  Grid.DataSource := nil;
  inherited;
  
  if Permitido(daCaiVerAntesOutros) or Permitido(daCaiVerAntes) then begin
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
  SAnt : Extended;
begin
  Refiltrar := False;
  Tab.DisableControls;
  try
    if NumAberto<1 then begin
      Tab.CancelRange;
      Tab.IndexName := 'INumero';
      Tab.Last;
      if Tab.RecordCount>0 then
        SAnt := TabSaldoFinal.Value
      else
        SAnt := 0;  

      Hora := Now;
      if MessageDlg('Confirma abertura do caixa de '+
                    FormatDateTime('dd/mm/yyyy hh:mm', Hora),
                    mtConfirmation,
                    [mbYes, mbNo], 0) = mrNo then Exit;
      Tab.Insert;
      TabAberto.Value := True;
      TabAbertura.Value := Hora;
      TabUsuario.Value := Dados.CM.Username;
      if Dados.tbConfigManterSaldoCaixa.Value then
        TabSaldoAnt.Value := SAnt;
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

procedure TfbgCaixas.TabCalcFields(DataSet: TDataSet);
begin
  TabTotal.Value :=
    (TabAcesso.Value + TabVenda.Value + TabAcessoDebPago.Value + TabVendaDebPago.Value) -
    (TabAcessoNaoPago.Value + TabVendaNaoPago.Value);

  TabSaldoFinal.Value :=
    TabSaldoAnt.Value +
    TabTotal.Value +
    TabSuprimento.Value -
    TabSangria.Value;
end;

procedure TfbgCaixas.cmPeriodoTudoClick(Sender: TObject);
begin
  inherited cmPeriodoTudoClick(Sender);
end;

procedure TfbgCaixas.GridTotalCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  inherited;
  AFont.Style := [fsBold];
end;

end.
