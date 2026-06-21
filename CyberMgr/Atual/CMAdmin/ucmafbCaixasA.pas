unit ucmafbCaixasA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, DB, nxdb, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxBar, dxBarExtItems, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxCalendar,
  cxCurrencyEdit, cxTextEdit, cxDBLookupComboBox, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbCaixasA = class(TFrmBase)
    Tab: TnxTable;
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
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    VNumero1: TcxGridDBColumn;
    VUsuario1: TcxGridDBColumn;
    VAbertura1: TcxGridDBColumn;
    VFechamento1: TcxGridDBColumn;
    VSaldoFinal1: TcxGridDBColumn;
    cmTotalizar: TdxBarLargeButton;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmEditarClick(Sender: TObject);
    procedure cmTotalizarClick(Sender: TObject);
  private
    { Private declarations }
    function GetIndexName: String;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    { Public declarations }
  end;

var
  fbCaixasA: TfbCaixasA;

implementation

uses ucmaPri, ucmaFrmCaixa, ucmaDM, cmIDRecursos;

{$R *.dfm}

class function TfbCaixasA.Descricao: String;
begin
  Result := 'Caixas Anteriores';
end;

procedure TfbCaixasA.FiltraDados;
begin
  if not Tab.Active then begin
    DataI := 1;
    DataF := EncodeDate(3000, 1, 1);
    cmPeriodo.Caption := 'Período: Tudo';
    Tab.Active := True;
    Tab.Last;
  end;  
  Tab.IndexName := GetIndexName;
  if Tab.IndexName = 'IUsuario' then
    Tab.SetRange([Dados.CM.Username], [Dados.CM.Username])
  else
    Tab.CancelRange;  
  Tab.Refresh;  
end;

procedure TfbCaixasA.TabCalcFields(DataSet: TDataSet);
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

procedure TfbCaixasA.cmEditarClick(Sender: TObject);
begin
  TFrmCaixa.Create(Self).Editar(Tab);
end;

procedure TfbCaixasA.cmTotalizarClick(Sender: TObject);
begin
  TFrmCaixa.Create(Self).CaixaPeriodo;
end;

procedure TfbCaixasA.AtualizaDireitos;
begin
  inherited;
  cmTotalizar.Enabled := Permitido(daCaiVerAntesOutros);
  if GetIndexName <> Tab.IndexName then FiltraDados;
end;

function TfbCaixasA.GetIndexName: String;
begin
  if Permitido(daCaiVerAntesOutros) then 
    Result := 'IAbertura'
  else
    Result := 'IUsuario';
end;

end.
