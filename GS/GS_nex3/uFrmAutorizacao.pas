unit uFrmAutorizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxDB, kbmMemTable, dxBar, dxBarExtItems, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxPC, cxControls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, Buttons, PngSpeedButton, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxContainer, cxLabel, Menus, cxDropDownEdit, cxImageComboBox,
  cxPropertiesStore, cxSpinEdit, StdCtrls, cxRadioGroup, cxCalendar, cxVGrid,
  cxInplaceContainer, nrAutorizacao, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinSeven, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, LMDBaseGraphicControl;

type
  
  TFrmAut = class(TForm)
    PagEdicao: TcxPageControl;
    tsCad: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl1: TdxBarDockControl;
    BarMgr: TdxBarManager;
    cmSalvarFechar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    cmBoleto: TdxBarLargeButton;
    dsMT: TDataSource;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    LMDSimplePanel7: TLMDSimplePanel;
    btnAdd: TPngSpeedButton;
    btnEditar: TPngSpeedButton;
    MT: TkbmMemTable;
    MTID: TAutoIncField;
    MTVencimento: TDateField;
    MTMaquinas: TWordField;
    MTTipo: TWordField;
    LMDSimplePanel3: TLMDSimplePanel;
    cxPropertiesStore1: TcxPropertiesStore;
    TVTipo: TcxGridDBColumn;
    TVMaquinas: TcxGridDBColumn;
    TVVencimento: TcxGridDBColumn;
    VG: TcxVerticalGrid;
    vgPrograma: TcxEditorRow;
    vgCodEquip: TcxEditorRow;
    vgMaq: TcxEditorRow;
    vgManut: TcxEditorRow;
    LMDSimplePanel4: TLMDSimplePanel;
    MTInativar: TBooleanField;
    vgSerieHD: TcxEditorRow;
    MTIncID: TAutoIncField;
    btnApagar: TPngSpeedButton;
    btnCanc: TLMDSpeedButton;
    btnSalvar: TLMDSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure vgProgramaEditPropertiesEditValueChanged(Sender: TObject);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure cmSalvarFecharClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dsMTStateChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
  private
    { Private declarations }
    A, B : TCabAutorizacao;
  public
    { Public declarations }
    procedure Editar(aLoja: Integer);
  end;

var
  FrmAut: TFrmAut;

implementation

uses uNexRegDM, uLicEXECryptor;

{$R *.dfm}

procedure TFrmAut.btnAddClick(Sender: TObject);
begin
  if MT.State in [dsEdit, dsInsert] then MT.Post;

  MT.Append;
end;

procedure TFrmAut.btnApagarClick(Sender: TObject);
begin
  if MTID.Value=0 then
    MT.Delete
  else begin
    MT.Edit;
    MTInativar.Value := True;
    MT.Post;
  end;
end;

procedure TFrmAut.btnCancClick(Sender: TObject);
begin
  MT.Cancel;
end;

procedure TFrmAut.btnSalvarClick(Sender: TObject);
begin
  MT.Post;
end;

procedure TFrmAut.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAut.cmSalvarFecharClick(Sender: TObject);
var 
  Aut: TAutorizacao;
begin
  VG.HideEdit;
  if MT.State in [dsInsert, dsEdit] then MT.Post;

  A.caPrograma := vgPrograma.Properties.Value;
  A.caCodEquip := vgCodEquip.Properties.Value;
  A.caSerieHD := vgSerieHD.Properties.Value;
  A.caMaquinas := vgMaq.Properties.Value;
  if vgManut.Properties.Value = null then
    A.caManut := 0 else
    A.caManut := vgManut.Properties.Value;
  
  dsMT.DataSet := nil;
  MT.Filtered := False;
  try
    MT.First;
    while not MT.Eof do begin
      if MTMaquinas.Value < 1 then 
        raise Exception.Create('Quantidade de máquinas não pode ser zero');
      if (MTTipo.Value<>taDefinitiva) and (MTTipo.Value<>taFreePremium) and MTVencimento.IsNull then
        raise Exception.Create('É necessário digitar o vencimento'); 
      MT.Next;
    end;
    MT.First;
    while not MT.Eof do begin
      if MTID.Value=0 then 
        Aut := A.NewItem else
        Aut := A.ItemByID(MTID.Value);
      Aut.auMaquinas := MTMaquinas.Value;
      Aut.auVencimento := MTVencimento.Value;
      Aut.auTipo := MTTipo.Value;
      Aut.auInativar := MTInativar.Value;
      MT.Next;
    end;
  finally
    MT.Filtered := True;
    dsMT.DataSet := MT;
  end;

  A.Save(UsuarioLogin, B, DM.tCli, DM.tAut); 
  Close;
end;

procedure TFrmAut.dsMTStateChange(Sender: TObject);
begin
  btnSalvar.Visible := (MT.State in [dsEdit, dsInsert]);
  btnCanc.Visible := (MT.State in [dsEdit, dsInsert]);
  btnAdd.Enabled := not btnSalvar.Visible;
  btnEditar.Enabled := not btnSalvar.Visible;
  btnApagar.Enabled := not btnSalvar.Visible;
end;

procedure TFrmAut.Editar(aLoja: Integer);
var I : Integer;
begin
  A.Load(aLoja, DM.tCli, DM.tAut);
  B.AssignFrom(A);
  vgPrograma.Properties.Value := A.caPrograma;
  vgCodEquip.Properties.Value := A.caCodEquip;
  vgSerieHD.Properties.Value := A.caSerieHD;
  vgMaq.Properties.Value := A.caMaquinas;
  if A.caManut=0 then
    vgManut.Properties.Value := null else
    vgManut.Properties.Value := A.caManut;

  for I := 0 to A.Count -1 do begin
    MT.Append;
    MTTipo.Value := A.Item(I).auTipo;
    MTID.Value := A.Item(I).auID;
    MTMaquinas.Value := A.Item(I).auMaquinas;
    MTVencimento.Value := A.Item(I).auVencimento;
    MT.Post;
  end;
  ShowModal;
end;

procedure TFrmAut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{ TCabAutorizacao }

procedure TFrmAut.FormCreate(Sender: TObject);
begin
  MT.Open;
  A := TCabAutorizacao.Create;
  B := TCabAutorizacao.Create;
end;

procedure TFrmAut.FormDestroy(Sender: TObject);
begin
  A.Free;
  B.Free;
end;

procedure TFrmAut.FormShow(Sender: TObject);
begin
  vgProgramaEditPropertiesEditValueChanged(nil);
end;

procedure TFrmAut.MTAfterInsert(DataSet: TDataSet);
begin
  MTID.Value := 0;
  MTTipo.Value := taTemporaria;
  MTInativar.Value := False;
end;

procedure TFrmAut.vgProgramaEditPropertiesEditValueChanged(Sender: TObject);
begin
  vgSerieHD.Visible := (vgPrograma.Properties.Value=null) or (vgPrograma.Properties.Value=0);
  vgCodEquip.Visible := (vgPrograma.Properties.Value<>null) and (vgPrograma.Properties.Value=1); 
  if vgCodEquip.Visible and (A.caSerieHD>'') and
    ((vgCodEquip.Properties.Value=null) or (Trim(vgCodEquip.Properties.Value)='')) then
    vgCodEquip.Properties.Value := SerialToCodEquip(A.caSerieHD); 
end;

end.
