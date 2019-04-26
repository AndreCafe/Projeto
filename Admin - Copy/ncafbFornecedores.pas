unit ncafbFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, 
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, 
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, uParentedPanel, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxLabel, cxRadioGroup, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxPSPrVwRibbon, cxNavigator, ncaFrmCadFornecedor;

type
  TfbFornecedores = class(TFrmBase)
    cmNovoFornecedor: TdxBarLargeButton;
    cmEditarFornecedor: TdxBarLargeButton;
    cmApagarFornecedor: TdxBarLargeButton;
    Tab: TnxTable;
    dsTab: TDataSource;
    TabID: TAutoIncField;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabSexo: TStringField;
    TabObs: TnxMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    TabTelefone: TStringField;
    TabEmail: TnxMemoField;
    TabMinutos: TFloatField;
    TabPassaportes: TFloatField;
    TabMinutosUsados: TFloatField;
    TabMinutosIniciais: TFloatField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabPai: TStringField;
    TabMae: TStringField;
    TabSenha: TStringField;
    TabUltVisita: TDateTimeField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    TabLimiteDebito: TCurrencyField;
    TabFoto: TGraphicField;
    TabIncluidoEm: TDateTimeField;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabTitEleitor: TStringField;
    TabFidPontos: TFloatField;
    TabFidTotal: TFloatField;
    TabFidResg: TFloatField;
    TabAniversario: TStringField;
    TabCotaImpEspecial: TBooleanField;
    TabCotaImpDia: TIntegerField;
    TabCotaImpMes: TIntegerField;
    TabSemFidelidade: TBooleanField;
    TabTemCredito: TBooleanField;
    TabNaoGuardarCredito: TBooleanField;
    TabPermiteLoginSemCred: TBooleanField;
    TabCHorario: TIntegerField;
    TabOpCHorario: TWordField;
    TabHP1: TIntegerField;
    TabHP2: TIntegerField;
    TabHP3: TIntegerField;
    TabHP4: TIntegerField;
    TabHP5: TIntegerField;
    TabHP6: TIntegerField;
    TabHP7: TIntegerField;
    TabInativo: TBooleanField;
    TabTipoAcessoPref: TIntegerField;
    TabFornecedor: TBooleanField;
    TabValorCred: TCurrencyField;
    panMostrar: TPanel;
    panBusca: TLMDSimplePanel;
    lbBusca: TcxLabel;
    edBusca: TcxMaskEdit;
    btnAchar: TcxButton;
    Grid: TcxGrid;
    TVprod: TcxGridDBTableView;
    GL: TcxGridLevel;
    TVprodID: TcxGridDBColumn;
    TVprodNome: TcxGridDBColumn;
    TVprodEndereco: TcxGridDBColumn;
    TVprodBairro: TcxGridDBColumn;
    TVprodCidade: TcxGridDBColumn;
    TVprodUF: TcxGridDBColumn;
    TVprodCEP: TcxGridDBColumn;
    TVprodObs: TcxGridDBColumn;
    TVprodCpf: TcxGridDBColumn;
    TVprodTelefone: TcxGridDBColumn;
    TVprodEmail: TcxGridDBColumn;
    TVprodCelular: TcxGridDBColumn;
    TVprodIncluidoEm: TcxGridDBColumn;
    TVprodAlteradoEm: TcxGridDBColumn;
    TVprodIncluidoPor: TcxGridDBColumn;
    TVprodAlteradoPor: TcxGridDBColumn;
    TVprodRg: TcxGridDBColumn;
    procedure cmNovoFornecedorClick(Sender: TObject);
    procedure cmEditarFornecedorClick(Sender: TObject);
    procedure btnAcharClick(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure cmApagarFornecedorClick(Sender: TObject);
  private
    { Private declarations }
    function TextoBusca: String;
  public
    class function Descricao: String; override;
    procedure RefreshBotoes;
    procedure FiltraDados; override;
    { Public declarations }
  end;


var
  fbFornecedores: TfbFornecedores;

implementation

uses ncaFrmPri, ufmImagens;

{$R *.dfm}


{ TfbFornecedores }

procedure TfbFornecedores.btnAcharClick(Sender: TObject);
begin
  inherited;
  {if TextoBusca>'' then begin
      Tab.SetRange([False, TextoBusca], [False, TextoBusca+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']);
  end else
    Tab.SetRange([False], [False]);}

  if (not btnAchar.Down) and (TextoBusca>'') then begin
    edBusca.Text := '';
    Tab.CancelRange;
  end;

end;

procedure TfbFornecedores.cmApagarFornecedorClick(Sender: TObject);
begin
  inherited;
  if SimNao('Confirma a exclusão de '+TabNome.Value+' ?') then Tab.Delete;

end;

procedure TfbFornecedores.cmEditarFornecedorClick(Sender: TObject);
var
  aNome:string;
begin
  if Tab.IsEmpty then Exit;

  TFrmCadFornecedor.Create(Self).Editar(Tab, nil);
end;

procedure TfbFornecedores.cmNovoFornecedorClick(Sender: TObject);
var
  aNome:string;
begin
  inherited;
  btnAchar.Down := False;
  btnAchar.Enabled := False;
  edBusca.Text := '';
  TFrmCadFornecedor.Create(Self).Novo(Tab, nil);
  RefreshBotoes;
end;

class function TfbFornecedores.Descricao: String;
begin
  Result := 'Fornecedores';
end;

procedure TfbFornecedores.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : cmEditarFornecedorClick(nil);
    VK_Escape : btnAcharClick(nil);
  end;
end;

procedure TfbFornecedores.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;

  FiltraDados;
end;

procedure TfbFornecedores.FiltraDados;
begin
  inherited;

  if not Tab.Active then
    Tab.Open;

  //Tab.Filter := 'Fornecedor=True';
  //Tab.Filtered := True;
  Tab.Filtered := false;
  Tab.IndexName := 'IFornecedorNome';

  if TextoBusca>'' then begin
      Tab.SetRange([True, TextoBusca], [True, TextoBusca+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']);
    btnAchar.Down := True;
    btnAchar.Enabled := True;
  end else begin
    Tab.SetRange([True], [True]);
    btnAchar.Down := False;
    btnAchar.Enabled := False;
  end;
  RefreshBotoes;
end;

procedure TfbFornecedores.RefreshBotoes;
var TemDados: Boolean;
begin
  TemDados := not Tab.IsEmpty;
  cmEditar.Enabled := TemDados;
  //cmNovo.Enabled := Permitido(daProCadastrar);
  //cmApagar.Enabled := Permitido(daProApagar) and TemDados;
end;

function TfbFornecedores.TextoBusca: String;
begin
  Result := Trim(edBusca.Text);
end;

end.
