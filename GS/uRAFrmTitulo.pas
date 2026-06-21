unit uRAFrmTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxVGrid, cxDBVGrid,
  cxControls, cxInplaceContainer, dxBar, dxBarExtItems, cxCheckBox,
  cxCurrencyEdit, cxDBLookupComboBox, DB, kbmMemTable, cxButtonEdit, uFreeBoleto;

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
    FRes: Boolean;
  public
    function Novo(AContato: Variant; ADataset: TDataset): Boolean;
    function Editar(AContato: Variant; ADataset: TDataset): Boolean;
    { Public declarations }
  end;

var
  FrmTitulo: TFrmTitulo;

implementation

uses uNexRegPri, uNexRegDM, {uRAFrmPC, uRAfbPlanoContas,} ufmImagens;

{$R *.dfm}

procedure TFrmTitulo.cmSalvarClick(Sender: TObject);
begin
  if FNovo then 
    FDataset.Insert
  else
    FDataset.Edit;
  TransfFields(MT.Fields, FDataset.Fields);
  FDataset.Post; 
  FRes := True;
  Close;  
end;

procedure TFrmTitulo.cmCancelarClick(Sender: TObject);
begin
  Close;
end;


function TFrmTitulo.Editar(AContato: Variant; ADataset: TDataset): Boolean;
begin
  FNovo := False;
  FContato := AContato;
  FDataset := ADataset;
  MT.Insert;
  TransfFields(FDataset.Fields, MT.Fields);
  MT.Post;
  MT.Edit;
  ShowModal;
  Result := FRes;
end;

function TFrmTitulo.Novo(AContato: Variant; ADataset: TDataset): Boolean;
begin
  FNovo := True;
  FContato := AContato;
  FDataset := ADataset;
  MT.Insert;
  MTLancamento.Value := Now;
  MTTipo.Value := 'R';
  MTLoja.AsVariant := FContato;
  MT.Post;
  MT.Edit;
  ShowModal;
  Result := FRes;
end;

procedure TFrmTitulo.FormShow(Sender: TObject);
begin
  VGContato.Visible := (FContato<>Null);
  VG.SetFocus;
  VG.FocusedRow := VGValor;
  VG.ShowEdit;
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
{  ID := MTPC.Value;
  Nome := MTNomePC.Value;
  TfbPC.Create(Self).Localizar(ID, Nome);
  MTPC.Value := ID;
  MTNomePC.Value := Nome;}
end;

procedure TFrmTitulo.FormCreate(Sender: TObject);
begin
  MT.Open;
  FRes := False;
end;

end.




                                                                                        
