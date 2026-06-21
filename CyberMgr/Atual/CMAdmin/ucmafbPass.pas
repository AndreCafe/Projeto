unit ucmafbPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxMaskEdit, cxCheckBox, cxCalendar, cxTimeEdit,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, nxdb,
  cxCurrencyEdit, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbPassaportes = class(TFrmBase)
    Tab: TnxTable;
    TabNumero: TAutoIncField;
    TabTipoPass: TIntegerField;
    TabCliente: TIntegerField;
    TabExpirou: TBooleanField;
    TabSenha: TStringField;
    TabPrimeiroUso: TDateTimeField;
    TabTipoAcesso: TIntegerField;
    TabTipoExp: TWordField;
    TabExpirarEm: TDateTimeField;
    TabMaxSegundos: TIntegerField;
    TabSegundos: TIntegerField;
    TabAcessos: TIntegerField;
    TabDia1: TIntegerField;
    TabDia2: TIntegerField;
    TabDia3: TIntegerField;
    TabDia4: TIntegerField;
    TabDia5: TIntegerField;
    TabDia6: TIntegerField;
    TabDia7: TIntegerField;
    TabTransacao: TIntegerField;
    TabDataCompra: TDateTimeField;
    TabNomePass: TStringField;
    TabValido: TBooleanField;
    TabValor: TCurrencyField;
    TabTempoTotal: TTimeField;
    TabTempoUsado: TTimeField;
    TabNomeCliente: TStringField;
    dsTab: TDataSource;
    Timer2: TTimer;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVSenha: TcxGridDBColumn;
    TVNumero: TcxGridDBColumn;
    TVExpirou: TcxGridDBColumn;
    TVDataCompra: TcxGridDBColumn;
    TVPrimeiroUso: TcxGridDBColumn;
    TVAcessos: TcxGridDBColumn;
    TVTempoTotal: TcxGridDBColumn;
    TVTempoUsado: TcxGridDBColumn;
    TVNomeCliente: TcxGridDBColumn;
    TVNomePass: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmMostrar: TdxBarCombo;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmMostrarChange(Sender: TObject);
    procedure TVPrimeiroUsoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmEditarClick(Sender: TObject);
    procedure FrmBasePaiClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbPassaportes: TfbPassaportes;

const
  fpass_Nenhum  = 0;
  fpass_Cliente = 1;  

implementation

uses ucmaPri, ucmaFrmPass, cmClassesBase, ucmaDM, cmAuxPassaporte, cmIDRecursos;

{$R *.dfm}

{ TfbPassaportes }

procedure TfbPassaportes.FiltraDados;
begin
  inherited;
  if not Tab.Active then Tab.Open;
  case cmMostrar.ItemIndex of
    0 : 
    if Operacao=fpass_Cliente then begin
      Tab.IndexName := 'ICliExpNumero';
      Tab.SetRange([Filtro, False], [Filtro, False]);
    end else begin
      Tab.IndexName := 'IExpNumero';
      Tab.SetRange([False], [False]);
    end;  

    1 : 
    if Operacao=fpass_Cliente then begin
      Tab.IndexName := 'ICliExpNumero';
      Tab.SetRange([Filtro, True], [Filtro, True]);
    end else begin
      Tab.IndexName := 'IExpNumero';
      Tab.SetRange([True], [True]);
    end;

    2 : begin
      Tab.IndexName := 'ISenha';
      Tab.CancelRange;
      Tab.Last;
    end;
  end;
end;

procedure TfbPassaportes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  Filtro := 0;
  cmMostrar.ItemIndex := 0;
  TVSenha.Hidden := not Permitido(daVerSenhaPassaporte);
  TVSenha.Visible := not TVSenha.Hidden;
end;

procedure TfbPassaportes.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTempoTotal.Value := TabMaxSegundos.Value / SegundosPorDia;
  TabTempoUsado.Value := TabSegundos.Value / SegundosPorDia;
end;

procedure TfbPassaportes.cmMostrarChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbPassaportes.TVPrimeiroUsoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if AText='30/12/1899' then
    AText := 'Sem Uso';
end;

procedure TfbPassaportes.cmEditarClick(Sender: TObject);
var 
  P : TPassaporte;
  Exp: Boolean;
  M : TCMMaquina;
begin
  if Tab.RecordCount > 0 then begin
    P.LoadFromDataset(Tab);
    P.pcNome := TabNomePass.Value;
    Exp := P.pcExpirou;
    TFrmPassaporte.Create(Self).Editar(False, @P);
    with Dados do
    if not Exp and P.pcExpirou then begin
      Tab.Edit;
      TabExpirou.Value := True;
      Tab.Post;
      M := Dados.CM.Maquinas.PorPassaporte[P.pcNumero];
      if M <> nil then begin
        M.AtualizaCache;
        LePassaportesCliTran(tbPass, tbHistPass, M.TipoAcesso, M.Contato, 0, M.Passaportes);
        CM.SalvaAlteracoesObj(M, False);
      end;  
    end;  
  end;  
end;

class function TfbPassaportes.Descricao: String;
begin
  Result := 'Passaportes';
end;

procedure TfbPassaportes.FrmBasePaiClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
