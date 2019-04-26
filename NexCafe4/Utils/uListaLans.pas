unit uListaLans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, StdCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  nxdb, nxllComponent, nxsdServerEngine, nxsrServerEngine, nxseAutoComponent;

type
  TFrmPri = class(TForm)
    nxServerEngine1: TnxServerEngine;
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    tCli: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliTipo: TWordField;
    tCliSenha: TStringField;
    tCliCadastroEm: TDateTimeField;
    tCliCadastroPor: TStringField;
    tCliAtualizadoEm: TDateTimeField;
    tCliAtualizadoPor: TStringField;
    tCliLoja: TStringField;
    tCliRazaoSocial: TStringField;
    tCliPais: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliEndereco: TnxMemoField;
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliCodEquip: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TnxMemoField;
    tCliTelefones: TnxMemoField;
    tCliEmailReg: TnxMemoField;
    tCliFormaPagto: TnxMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
    tCliProprietarios: TnxMemoField;
    tCliGerente: TStringField;
    tCliTipoLoja: TWordField;
    tCliEmailTec: TnxMemoField;
    tCliValor: TCurrencyField;
    tCliValorRec: TCurrencyField;
    tCliEmitirNF: TBooleanField;
    tCliMessenger: TnxMemoField;
    tCliICQ: TnxMemoField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliNegociacao: TWordField;
    tCliStatus: TIntegerField;
    tCliContatarEm: TDateTimeField;
    tCliPrograma: TWordField;
    tCliBloqueado: TBooleanField;
    tCliCliente: TBooleanField;
    tCliAtivado: TBooleanField;
    tCliCodAtivacao: TStringField;
    tCliEmailConta: TStringField;
    tCliAtivadoEm: TDateTimeField;
    tCliTipoConta: TWordField;
    tCliPremiumAte: TDateTimeField;
    tCliCodDesc: TStringField;
    Panel1: TPanel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    TVCodigo: TcxGridDBColumn;
    TVLoja: TcxGridDBColumn;
    TVCidade: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    TVProprietarios: TcxGridDBColumn;
    TVEmailConta: TcxGridDBColumn;
    nxseAllEngines1: TnxseAllEngines;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses cxGridExportLink;

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  ExportGridToExcel('c:\meus programas\nexcafe\lista_lans.xls', Grid);

  ShowMessage(IntToStr(tCli.recordCount));
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  tCli.Open;
  tCli.SetRange([5, EncodeDate(2010, 11, 25)], [5, EncodeDate(2010, 12, 1)]);

end;

end.
