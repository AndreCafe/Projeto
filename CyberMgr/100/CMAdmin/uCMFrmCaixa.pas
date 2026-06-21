unit uCMFrmCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp,
  ExtCtrls, dxBar, ffDB, ComCtrls, dxTL, dxDBCtrl, dxDBGrid, dxExEdtr,
  dxBarExtItems;

type
  TFrmCaixa = class(TForm)
    BarMgr: TdxBarManager;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    TabNumero: TAutoIncField;
    TabAbertura: TDateTimeField;
    TabFechamento: TDateTimeField;
    TabUsuario: TStringField;
    TabDescontos: TCurrencyField;
    TabInternet: TCurrencyField;
    TabSaldoAnt: TCurrencyField;
    TabAberto: TBooleanField;
    TabVendas: TCurrencyField;
    TabObs: TMemoField;
    TabSaldoFinal: TCurrencyField;
    TabPacotes: TCurrencyField;
    TabSubTotal: TCurrencyField;
    TabLancExtrasE: TCurrencyField;
    TabLancExtrasS: TCurrencyField;
    Panel1: TPanel;
    PageControl1: TPageControl;
    tsVendasTotal: TTabSheet;
    Insp: TdxDBInspector;
    InspNumero: TdxInspectorDBMaskRow;
    InspAbertura: TdxInspectorDBDateRow;
    InspFechamento: TdxInspectorDBDateRow;
    InspUsuario: TdxInspectorDBMaskRow;
    InspLancExtras: TdxInspectorDBCurrencyRow;
    InspDescontos: TdxInspectorDBCurrencyRow;
    InspInternet: TdxInspectorDBCurrencyRow;
    InspSaldoAnt: TdxInspectorDBCurrencyRow;
    InspVendas: TdxInspectorDBCurrencyRow;
    InspObs: TdxInspectorDBMemoRow;
    InspSaldoFinal: TdxInspectorDBRow;
    InspPacotes: TdxInspectorDBCurrencyRow;
    InspRow14: TdxInspectorDBCurrencyRow;
    InspRow15: TdxInspectorDBCurrencyRow;
    tsVendasProd: TTabSheet;
    dsQVP: TDataSource;
    qVP: TffQuery;
    gridVP: TdxDBGrid;
    gridVPDescricao: TdxDBGridMaskColumn;
    gridVPQuant: TdxDBGridMaskColumn;
    gridVPTotal: TdxDBGridMaskColumn;
    qVC: TffQuery;
    dsQVC: TDataSource;
    TabSheet1: TTabSheet;
    gridVC: TdxDBGrid;
    gridVCCategoria: TdxDBGridMaskColumn;
    gridVCTotal: TdxDBGridMaskColumn;
    gridVCQuant: TdxDBGridMaskColumn;
    cmGravar: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    Panel2: TPanel;
    cmCancela: TdxBarLargeButton;
    TabAcessoDesc: TCurrencyField;
    InspRow16: TdxInspectorDBRow;
    InspRow17: TdxInspectorDBCurrencyRow;
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InspSaldoFinalDrawCaption(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspSaldoFinalDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cmCancelaClick(Sender: TObject);
    procedure InspDescontosDrawCaption(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspDescontosDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
  private
    { Private declarations }
  public
    FTab : TffTable;
    FFechar : Boolean;
    procedure Editar(aTab: TffTable);
    procedure Fechar(aTab: TffTable);
    { Public declarations }
  end;

var
  FrmCaixa: TFrmCaixa;

implementation

uses uCMFrmPri, uCMDados;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmCaixa.Fechar(aTab: TffTable);
begin
  cmGravar.Caption := '&Fechar Caixa';
  FFechar := True;
  cmGravar.GlyphLayout := glTop;
  cmCancela.GlyphLayout := glTop;
  Editar(aTab);
end;

procedure TFrmCaixa.Editar(aTab: TffTable);
begin
  FTab := aTab;
  Tab.Insert;
  TransfDados(FTab, Tab);
  Tab.Post;
  Tab.Edit;
  qVP.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;
  QVP.Prepare;
  qVP.Open;
  qVC.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;
  qVC.Prepare;
  qVC.Open;
  ShowModal;
end;

procedure TFrmCaixa.cmGravarClick(Sender: TObject);
var Aguardando: Double;
begin
  if FFechar and (Now < FTab.FieldByName('Abertura').AsDateTime ) then 
  begin
    Beep;
    ShowMessage('Data ou Hora de fechamento anterior a abertura!');
    Exit;
  end;
  Aguardando := 0;

  if FFechar then begin
    Aguardando := Dados.ObtemAguardando;
    if Aguardando>0.009 then
    if MessageDlg('Existe ' + FloatToStrF(Aguardando, ffCurrency, 10, 2) + 
                  ' em  acessos aguardando pagamento. Deseja realmente fechar o caixa ?', 
                  mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
                  
    if MessageDlg('Deseja realmente fechar o caixa ?', 
                  mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
  end;                
  
  Tab.Post;
  FTab.Edit;

  if FFechar then begin 
    FTab.FieldByName('AguardandoPagto').AsFloat := Aguardando;               
    FTab.FieldByName('Aberto').AsBoolean := False;
    FTab.FieldByName('Fechamento').AsDateTime := Now;
  end;  
  FTab.FieldByName('Obs').Value := TabObs.Value;
  FTab.Post;
  
  DiaAberto := 0;
  NumAberto := -1;
  
  Close;
end;

procedure TFrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCaixa.InspSaldoFinalDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
end;

procedure TFrmCaixa.InspSaldoFinalDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
  AFont.Size  := 12;
end;

procedure TFrmCaixa.FormCreate(Sender: TObject);
begin
  cmGravar.Caption := '&Gravar';
  FFechar := False;
  Tab.Open;
end;

procedure TFrmCaixa.TabCalcFields(DataSet: TDataSet);
begin
  TabAcessoDesc.Value := TabInternet.Value + TabDescontos.Value;
  
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

procedure TFrmCaixa.FormShow(Sender: TObject);
begin
  Caption := 'Caixa de ' + FormatDateTime('dd/mm/yyyy hh:mm', TabAbertura.Value);
end;

procedure TFrmCaixa.cmCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCaixa.InspDescontosDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Color := clRed;
end;

procedure TFrmCaixa.InspDescontosDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Color := clRed;
end;

end.
