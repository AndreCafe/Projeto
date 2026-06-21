unit uRAFrmTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxVGrid, cxDBVGrid,
  kbmMWClientDataset,
  cxControls, cxInplaceContainer, dxBar, dxBarExtItems, cxCheckBox,
  cxCurrencyEdit, cxDBLookupComboBox, DB, kbmMemTable, cxButtonEdit;

type
  TFrmTitulo = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    VG: TcxDBVerticalGrid;
    VGVencimento: TcxDBEditorRow;
    VGPagamento: TcxDBEditorRow;
    VGValor: TcxDBEditorRow;
    VGValorPago: TcxDBEditorRow;
    VGObs: TcxDBEditorRow;
    VGDoc: TcxDBEditorRow;
    VGDescricao: TcxDBEditorRow;
    VGLancamento: TcxDBEditorRow;
    VGTipo: TcxDBEditorRow;
    VGNomePC: TcxDBEditorRow;
    VGContato: TcxDBEditorRow;
    MT: TkbmMemTable;
    MTID: TIntegerField;
    MTLoja: TIntegerField;
    MTVencimento: TDateField;
    MTPagamento: TDateField;
    MTValor: TCurrencyField;
    MTValorPago: TCurrencyField;
    MTObs: TMemoField;
    MTDoc: TStringField;
    MTDescricao: TStringField;
    MTLancamento: TDateTimeField;
    MTTipo: TStringField;
    MTPC: TIntegerField;
    MTNomeLoja: TStringField;
    DS: TDataSource;
    MTNomePC: TStringField;
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VGNomePCEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FNovo: Boolean;
    FContato: Variant;
    FDataset: TDataset;
  public
    procedure Novo(AContato: Variant; ADataset: TDataset);
    procedure Editar(AContato: Variant; ADataset: TDataset);
    { Public declarations }
  end;

var
  FrmTitulo: TFrmTitulo;

implementation

uses uRAPri, uRADM, uRAFrmPC, uRAfbPlanoContas, ufmImagens;

{$R *.dfm}

procedure TFrmTitulo.cmSalvarClick(Sender: TObject);
begin
  if FNovo then 
    FDataset.Insert
  else
    FDataset.Edit;
  TransfFields(MT.Fields, FDataset.Fields);
  FDataset.Post;    
  Close;  
end;

procedure TFrmTitulo.cmCancelarClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmTitulo.Editar(AContato: Variant; ADataset: TDataset);
begin
  FNovo := False;
  FContato := AContato;
  FDataset := ADataset;
  MT.Insert;
  TransfFields(FDataset.Fields, MT.Fields);
  MT.Post;
  MT.Edit;
  ShowModal;
end;

procedure TFrmTitulo.Novo(AContato: Variant; ADataset: TDataset);
begin
  FNovo := True;
  FContato := AContato;
  FDataset := FDataset;
  MT.Insert;
  MTLancamento.Value := Now;
  MTTipo.Value := 'R';
  MTLoja.AsVariant := FContato;
  MT.Post;
  MT.Edit;
end;

procedure TFrmTitulo.FormShow(Sender: TObject);
begin
  VGContato.Visible := (FContato<>Null);
end;

procedure TFrmTitulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTitulo.VGNomePCEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  ID : Integer;
  Nome: String;  
begin
  ID := MTPC.Value;
  Nome := MTNomePC.Value;
  TfbPC.Create(Self).Localizar(ID, Nome);
  MTPC.Value := ID;
  MTNomePC.Value := Nome;
end;

procedure TFrmTitulo.FormCreate(Sender: TObject);
begin
  MT.Open;
end;

end.




                                                                                        
