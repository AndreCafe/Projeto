unit uDTFrmItemRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, 
  StdCtrls, Buttons, DB,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, DBCtrls, ovcbase, ovcef, ovcpb, ovcnf, ovcdbnf, cxStyles,
  cxGraphics, cxEdit, cxMaskEdit, cxCurrencyEdit, cxMemo, cxVGrid, cxDBVGrid,
  cxControls, cxInplaceContainer, kbmMemTable, cxImageComboBox;

type
  TFrmItemRA = class(TForm)
    panBotoes: TLMDSimplePanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    MT: TkbmMemTable;
    dsMT: TDataSource;
    MTSync: TBooleanField;
    MTData: TDateField;
    MTID: TWordField;
    MTIDRA: TWordField;
    MTTipo: TWordField;
    MTValor: TCurrencyField;
    MTJustDiverg: TMemoField;
    MTDescr: TMemoField;
    MTNumF: TIntegerField;
    MTValorDef: TCurrencyField;
    MTONServ: TBooleanField;
    MTExcluirServ: TBooleanField;
    LMDSimplePanel1: TLMDSimplePanel;
    VG: TcxDBVerticalGrid;
    VGData: TcxDBEditorRow;
    VGID: TcxDBEditorRow;
    VGIDRA: TcxDBEditorRow;
    VGTipo: TcxDBEditorRow;
    VGValor: TcxDBEditorRow;
    VGJustDiverg: TcxDBEditorRow;
    VGDescr: TcxDBEditorRow;
    VGNumF: TcxDBEditorRow;
    VGValorDef: TcxDBEditorRow;
    VGValorTec: TcxDBEditorRow;
    VGStatusTec: TcxDBEditorRow;
    vgFechAprov: TcxCategoryRow;
    MTValorTec: TCurrencyField;
    MTStatusTec: TWordField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edTipoChange(Sender: TObject);
  private
    FTab: TDataset;
    FNovo : Boolean;
    procedure Valida;
    procedure AjustaMask;
    { Private declarations }
  public
    procedure Novo(aTab: TDataset);
    procedure Editar(aTab: TDataset);
    { Public declarations }
  end;

var
  FrmItemRA: TFrmItemRA;

implementation

uses uDTFrmRA, uDTDM, uDTSyncDef;

{$R *.dfm}

{ TFrmItemRA }

procedure TransfDados(TF, TD: TDataset);
var
  I : Integer;
  F : TField;
begin
  for I := 0 to TD.FieldCount - 1 do with TD.Fields[I] do
  begin
    F := TF.FindField(FieldName);
    if (F<>nil) and (FieldKind=fkData) then
      Value := F.Value;
  end;
end;

procedure TFrmItemRA.Editar(aTab: TDataset);
begin
  FTab := aTab;
  FNovo := False;
  MT.Insert;
  TransfDados(FTab, MT);
  MT.Post;    
  MT.Edit;
  btnOK.Enabled := (MTIDRA.IsNull);
  vgFechAprov.Visible := (MTNumF.Value>0);
  vgJustDiverg.Visible := (MTStatusTec.Value in [sfratAprovDiverg, sfratReprovado]);
  AjustaMask;
  ShowModal;
end;

procedure TFrmItemRA.Novo(aTab: TDataset);
begin                   
  FTab := aTab;
  VGIDRA.Visible := False;
  MT.Insert;
  MTID.Value := DM.ProxIDItem;
  MTTipo.Value := tiraKM;
  MTData.Value := Date;
  edTipoChange(nil);
  FNovo := True;
  vgFechAprov.Visible := False;
  ShowModal;
end;

procedure TFrmItemRA.btnOkClick(Sender: TObject);
begin
  Valida;
  VG.DataController.PostEditingData;
  if FNovo then
    FTab.Insert
  else
    FTab.Edit;
  TransfDados(MT, FTab);    
  FTab.Post;
  Close;
end;

procedure TFrmItemRA.Valida;
begin
  with FrmRA do begin
    if MTValor.Value < 1 then
      Raise Exception.Create('Valor/Quantidade não foi informado!');
  end;
end;

procedure TFrmItemRA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmItemRA.FormCreate(Sender: TObject);
begin
  MT.Open;
end;

procedure TFrmItemRA.FormShow(Sender: TObject);
begin
  VG.FocusedRow  := VGTipo;
  VG.FocusedRow  := VGData;
end;

procedure TFrmItemRA.edTipoChange(Sender: TObject);
begin
  MTValorDef.Value := DM.ObtemValorRADef(MTTipo.Value);
  MTValor.Value := MTValorDef.Value;
  AjustaMask;
end;

procedure TFrmItemRA.AjustaMask;
begin
  if MTTipo.Value = tiraKM  then begin
    TcxCurrencyEditProperties(VGValor.Properties.EditProperties).DisplayFormat := '####';
    TcxCurrencyEditProperties(VGValorDef.Properties.EditProperties).DisplayFormat := '####';
    VGValor.Properties.Caption := 'Quantidade';
    VGValorDef.Properties.Caption := 'Quant. Padrão';
  end else begin
    TcxCurrencyEditProperties(VGValor.Properties.EditProperties).DisplayFormat := 'R$ ,0.00;(R$ ,0.00)';
    TcxCurrencyEditProperties(VGValorDef.Properties.EditProperties).DisplayFormat := 'R$ ,0.00;(R$ ,0.00';
    VGValor.Properties.Caption := 'Valor';
    VGValorDef.Properties.Caption := 'Valor Padrão';
  end;
end;

end.





