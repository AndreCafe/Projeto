unit uFrmDadosTot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, dxCntner, dxTL, dxDBCtrl, dxDBGrid, lmdstdcA,
  lmdctrl, lmdstdcS, lmdcctrl, Db, kbmMemTable, lmdcompo, lmdclass,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox,
  LMDCustomComponent, LMDIniCtrl, OvcBase, dxExEdtr;

const
  // Ordem Colunas
  ocAlfabetica = 0;
  ocQuantidade = 1;
  ocCustomizar = 2;

  // Tipo Tot
  ttContar = 0;
  ttSomar  = 1;
  ttMin    = 2;
  ttMax    = 3;
  ttMedia  = 4;

    
type

  PTotInfo = ^TTotInfo;
  TTotInfo = object
    tiCampo       : Array[1..3] of String[40];
    tiNumCampos   : Integer;
    tiChave       : String[40];
    tiMaxCols     : Byte;
    tiMostraOutros: Boolean;
    tiMostraMedia : Boolean;
    tiColunas     : Array[1..25] of String[50];
    tiOrdem       : Byte;
    tiTitulo      : String[100];
    tiTipoTot     : Byte;
    tiCampoTot    : String[40];
    tiTipoCampoTot: TFieldType;
    tiDisplayFormat: String[40];
    procedure Limpa;
    procedure LoadDefOptions(Grid: TdxDBGrid);
    function Alterou(Ant: TTotInfo): Boolean;
    procedure Save(INI: TLMDIniCtrl);
    procedure Load(INI: TLMDIniCtrl);
  end;  

  TFrmDadosTot = class(TForm)
    LMDGroupBox1: TLMDGroupBox;
    LMDSimpleLabel1: TLMDSimpleLabel;
    cbCampo2: TComboBox;
    LMDSimpleLabel2: TLMDSimpleLabel;
    GroupBox2: TGroupBox;
    cbCampo1: TComboBox;
    cbChave: TComboBox;
    cbMostraOutros: TCheckBox;
    cbMostraMedia: TCheckBox;
    LMDSimpleLabel4: TLMDSimpleLabel;
    LMDSimpleLabel5: TLMDSimpleLabel;
    edMaxCol: TLMDSpinEdit;
    LMDSimpleLabel6: TLMDSimpleLabel;
    cbOrdem: TComboBox;
    GridCust: TdxDBGrid;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    mtCol: TkbmMemTable;
    mtColPos: TIntegerField;
    mtColColuna: TStringField;
    dsCol: TDataSource;
    GridCustPos: TdxDBGridMaskColumn;
    GridCustColuna: TdxDBGridMaskColumn;
    Label1: TLabel;
    edTitulo: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cbTipoTot: TComboBox;
    Label3: TLabel;
    cbCampoTot: TComboBox;
    procedure edMaxColChange(Sender: TObject);
    procedure cbCampo1Change(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
    procedure cbMostraOutrosClick(Sender: TObject);
    procedure cbMostraMediaClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbChaveChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCustEnter(Sender: TObject);
    procedure edTituloChange(Sender: TObject);
    procedure cbCampoTotChange(Sender: TObject);
    procedure cbTipoTotChange(Sender: TObject);
  private
    tiAnt: PTotInfo;
    tiAtual: TTotInfo;
    { Private declarations }
  public
    { Public declarations }
    Grid: TdxDBGrid;
    Resultado: Boolean;
    function Mostra(aGrid: TdxDBGrid; PTI: PTotInfo): Boolean;
  end;

function ColCaptionToFieldName(Grid: TdxDBGrid; CCaption: String): String;
function ColFieldNameToCaption(Grid: TdxDBGrid; CFieldName: String): String;
function ColCaptionToField(Grid: TdxDBGrid; CCaption: String): TField;

var
  FrmDadosTot: TFrmDadosTot;

const
  SecaoTot = 'Totalização';  

implementation

{$R *.DFM}

function ColCaptionToFieldName(Grid: TdxDBGrid; CCaption: String): String;
var I : Integer;
begin
  if CCaption > '' then
  with Grid do
  for I := 0 to pred(ColumnCount) do
  with Columns[I] do
  if Caption = CCaption then begin
    Result := FieldName;
    Exit;
  end;
  Result := '';
end;

function ColCaptionToField(Grid: TdxDBGrid; CCaption: String): TField;
var I : Integer;
begin
  if CCaption > '' then
  with Grid do
  for I := 0 to pred(ColumnCount) do
  with Columns[I] do
  if Caption = CCaption then begin
    Result := Field;
    Exit;
  end;
  Result := nil;
end;


function ColFieldNameToCaption(Grid: TdxDBGrid; CFieldName: String): String;
var I : Integer;
begin
  if CFieldName > '' then
  with Grid do
  for I := 0 to pred(ColumnCount) do
  with Columns[I] do
  if FieldName = CFieldName then begin
    Result := Caption;
    Exit;
  end;
  Result := '';
end;

procedure TTotInfo.Save(INI: TLMDIniCtrl);
var I : Integer;
begin
  with INI do begin
    WriteInteger(SecaoTot, 'NumCampos', tiNumCampos);

    for I := 1 to 3 do
    WriteString(SecaoTot, 'Campo'+IntToStr(I), tiCampo[I]);

    WriteString(SecaoTot, 'Chave', tiChave);
    WriteInteger(SecaoTot, 'MaxCols', tiMaxCols);
    WriteBool(SecaoTot, 'MostraOutros', tiMostraOutros);
    WriteBool(SecaoTot, 'MostraMedia', tiMostraMedia);
    WriteInteger(SecaoTot, 'Ordem', tiOrdem);
    WriteString(SecaoTot, 'Titulo', tiTitulo);

    for I := 1 to 25 do 
    WriteString(SecaoTot, 'Coluna'+IntToStr(I), tiColunas[I]);

    WriteInteger(SecaoTot, 'TipoTot', tiTipoTot);
    WriteString(SecaoTot, 'CampoTot', tiCampoTot);
    WriteInteger(SecaoTot, 'TipoCampoTot', Integer(tiTipoCampoTot));
    WriteString(SecaoTot, 'DisplayFormat', tiDisplayFormat);
  end;  
end;

procedure TTotInfo.Load(INI: TLMDIniCtrl);
var I : Integer;
begin
  with INI do begin
    tiNumCampos := ReadInteger('Totalização', 'NumCampos', tiNumCampos);
    
    for I := 1 to 3 do
    tiCampo[I] := ReadString(SecaoTot, 'Campo'+IntToStr(I), tiCampo[I]);

    tiChave := ReadString(SecaoTot, 'Chave', tiChave);
    tiMaxCols := ReadInteger(SecaoTot, 'MaxCols', tiMaxCols);
    tiMostraOutros := ReadBool(SecaoTot, 'MostraOutros', tiMostraOutros);
    tiMostraMedia := ReadBool(SecaoTot, 'MostraMedia', tiMostraMedia);
    tiOrdem := ReadInteger(SecaoTot, 'Ordem', tiOrdem);
    tiTitulo := ReadString(SecaoTot, 'Titulo', '');

    for I := 1 to 25 do 
    tiColunas[I] := ReadString(SecaoTot, 'Coluna'+IntToStr(I), '');  

    tiTipoTot := ReadInteger(SecaoTot, 'TipoTot', tiTipoTot);
    tiCampoTot := ReadString(SecaoTot, 'CampoTot', tiCampoTot);
    tiTipoCampoTot := TFieldType(ReadInteger(SecaoTot, 'TipoCampoTot', Integer(ftInteger)));
    tiDisplayFormat := ReadString(SecaoTot, 'DisplayFormat', tiDisplayFormat); 
  end;  
end;

function TTotInfo.Alterou(Ant: TTotInfo): Boolean;
var I : Integer;
begin
  Result := True;
  if tiNumCampos <> Ant.tiNumCampos then Exit;
  if tiChave <> Ant.tiChave then Exit;
  if tiMaxCols <> Ant.tiMaxCols then Exit;
  if tiOrdem <> Ant.tiOrdem then Exit;
  for I := 1 to tiNumCampos do
  if tiCampo[I] <> Ant.tiCampo[I] then Exit;

  if tiTipoTot <> Ant.tiTipoTot then Exit;
  if tiCampoTot <> Ant.tiCampoTot then Exit;
  if tiTipoCampoTot <> Ant.tiTipoCampoTot then Exit;
  if tiDisplayFormat <> Ant.tiDisplayFormat then Exit;

  for I := 1 to tiMaxCols do
  if tiColunas[I] <> Ant.tiColunas[I] then Exit;
  
  Result := False;
end;

procedure TTotInfo.Limpa;
begin
  FillChar(Self, SizeOf(Self), 0);
  tiOrdem := ocQuantidade;
  tiMaxCols := 25;
  tiMostraMedia := True;
  tiMostraOutros := True;
  tiTipoTot := 0;
  tiTipoCampoTot := ftUnknown;
end;

procedure TTotInfo.LoadDefOptions(Grid: TdxDBGrid);
var I : Integer;
begin
  Limpa;
  with Grid do begin
    if GroupColumnCount > 0 then 
      tiChave := GroupColumns[0].FieldName
    else begin
      tiMostraMedia := False;
      tiMostraOutros := False;
    end; 

    tiNumCampos := 0;
    I := 0;
{    while (I < ColumnCount) and (tiNumCampos<2) do begin
      with Columns[I] do
      if Visible and 
         (Pos(FieldName, Filter.FilterText)<1) and 
         (not DisableGrouping) then 
      begin
        Inc(tiNumCampos);
        tiCampo[tiNumCampos] := FieldName;
      end;
      Inc(I);
    end; }
    
  end;  
end;

function TFrmDadosTot.Mostra(aGrid: TdxDBGrid; PTI: PTotInfo): Boolean;
var I : Integer;
begin
  Grid := aGrid;
  tiAnt := PTI;
  Move(PTI^, tiAtual, SizeOf(tiAtual));
  
  cbCampo1.Items.Add('--- Nenhum');
  cbCampo2.Items.Add('--- Nenhum');
  with Grid do 
  for I := 0 to pred(ColumnCount) do with Columns[I] do
  if (not DisableGrouping) then begin
    cbCampo1.Items.Add(Caption);
    cbCampo2.Items.Add(Caption);
    cbChave.Items.Add(Caption);
    if Columns[I].Field.DataType in 
    [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftAutoInc]
    then
      cbCampoTot.Items.Add(Caption);
  end;

  with tiAtual do begin
    edTitulo.Text := tiAtual.tiTitulo;
    cbCampo1.ItemIndex := cbCampo1.Items.IndexOf(ColFieldNameToCaption(Grid, tiCampo[1]));
    cbCampo2.ItemIndex := cbCampo2.Items.IndexOf(ColFieldNameToCaption(Grid, tiCampo[2]));
    cbChave.ItemIndex := cbChave.Items.IndexOf(ColFieldNameToCaption(Grid, tiChave));
    cbCampoTot.ItemIndex := cbCampoTot.Items.IndexOf(ColFieldNameToCaption(Grid, tiCampoTot));
    if cbCampo1.ItemIndex=-1 then
      cbCampo1.ItemIndex := 0;
    if cbCampo2.ItemIndex=-1 then
      cbCampo2.ItemIndex := 0;
    if cbChave.ItemIndex=-1 then
      cbChave.ItemIndex := 0;
    cbChaveChange(cbChave);  
    cbCampo1Change(cbCampo1);
    cbMostraOutros.Checked := tiMostraOutros;
    cbMostraMedia.Checked := tiMostraMedia;
    cbOrdem.ItemIndex := tiAtual.tiOrdem;
    edMaxCol.Value := tiAtual.tiMaxCols;
    cbOrdemChange(cbOrdem);
    cbTipoTot.ItemIndex := tiAtual.tiTipoTot;
    cbTipoTotChange(nil);
  end;
  
  mtCol.First;
  Resultado := False;
  
  ShowModal;
  Result := Resultado;
end;

procedure TFrmDadosTot.edMaxColChange(Sender: TObject);
begin
  tiAtual.tiMaxCols := edMaxCol.Value;
  while mtCol.RecordCount > edMaxCol.Value do begin
    mtCol.Last;
    mtCol.Delete;
  end;

  while mtCol.RecordCount < edMaxCol.Value do begin
    mtCol.Append;
    mtColPos.Value := mtCol.RecordCount + 1;
    mtColColuna.Value := tiAtual.tiColunas[mtColPos.Value];
    mtCol.Post;
  end;  
end;

procedure TFrmDadosTot.cbCampo1Change(Sender: TObject);
begin
  with TComboBox(Sender) do
  if (ItemIndex>0) then
    tiAtual.tiCampo[Tag] := ColCaptionToFieldName(Grid, Text)
  else
    tiAtual.tiCampo[Tag] := '';  
  
  cbCampo2.Enabled := (cbCampo1.ItemIndex > 0);
  if cbCampo2.Enabled and (cbCampo2.ItemIndex>0) then
    tiAtual.tiNumCampos := 2
  else
  if cbCampo1.ItemIndex>0 then
    tiAtual.tiNumCampos := 1
  else
    tiAtual.tiNumCampos := 0;    
end;

procedure TFrmDadosTot.cbOrdemChange(Sender: TObject);
begin
  tiAtual.tiOrdem := cbOrdem.ItemIndex;
  GridCust.Visible := (tiAtual.tiOrdem = ocCustomizar);
  edMaxColChange(edMaxCol);
end;

procedure TFrmDadosTot.cbMostraOutrosClick(Sender: TObject);
begin
  tiAtual.tiMostraOutros := cbMostraOutros.Checked;
end;

procedure TFrmDadosTot.cbMostraMediaClick(Sender: TObject);
begin
  tiAtual.tiMostraMedia := cbMostraMedia.Checked;
end;

procedure TFrmDadosTot.btnOkClick(Sender: TObject);
begin
  if (tiAtual.tiTipoTot <> ttContar) and 
     (tiAtual.tiCampoTot = '') then begin
    cbCampoTot.SetFocus;
    Beep;
    ShowMessage('O Campo de Totalização tem que ser informado!');
    Exit;
  end;   
  mtCol.First;
  while not mtCol.Eof do begin
    tiAtual.tiColunas[mtColPos.AsInteger] := mtColColuna.Value;
    mtCol.Next;
  end;
  Move(tiAtual, tiAnt^, SizeOf(tiAtual));
  Resultado := True;
  Close;
end;

procedure TFrmDadosTot.cbChaveChange(Sender: TObject);
begin
  if cbChave.Text > '' then
    tiAtual.tiChave := ColCaptionToFieldName(Grid, cbChave.Text)
  else
    tiAtual.tiChave := '';  
end;

procedure TFrmDadosTot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDadosTot.GridCustEnter(Sender: TObject);
begin
  GridCust.FocusedColumn := 1;
end;

procedure TFrmDadosTot.edTituloChange(Sender: TObject);
begin
  tiAtual.tiTitulo := Trim(edTitulo.Text);
end;

procedure TFrmDadosTot.cbCampoTotChange(Sender: TObject);
var F : TField;
begin
  if cbCampoTot.Text > '' then begin
    F := ColCaptionToField(Grid, cbCampoTot.Text);
    tiAtual.tiCampoTot := F.FieldName;
    tiAtual.tiTipoCampoTot := F.DataType;
    if F is TDateTimeField then
      tiAtual.tiDisplayFormat := TDateTimeField(F).DisplayFormat
    else
      tiAtual.tiDisplayFormat := '';  
  end else begin
    tiAtual.tiCampoTot := '';  
    tiAtual.tiTipoCampoTot:= ftUnknown;
    tiAtual.tiDisplayFormat := '';
  end;  
end;

procedure TFrmDadosTot.cbTipoTotChange(Sender: TObject);
begin
  tiAtual.tiTipoTot := cbTipoTot.ItemIndex;
  cbCampoTot.Enabled := (cbTipoTot.ItemIndex>0);
  if not cbCampoTot.Enabled then
    cbCampoTot.ItemIndex := -1;
  cbCampoTotChange(nil);
end;

end.
