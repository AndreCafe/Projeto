unit uCMFrmCor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDBTLCl, dxGrClEx, StdCtrls, lmdcombo, lmdextcS, dxTL, dxDBCtrl,
  dxDBGrid, Db, kbmMemTable, dxCntner, lmdcctrl, lmdctrl, dxBar, 
  uCMDados,
  {$ifdef Ver150}
  Variants,
  {$endif}
  dxGrClms, LMDCustomComboBox, LMDCustomColorComboBox, LMDColorComboBox,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxExEdtr;

type
  TFrmCor = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    LMDSimplePanel1: TLMDSimplePanel;
    Grid: TdxDBGrid;
    mtCores: TkbmMemTable;
    mtCoresItem: TStringField;
    mtCoresCorFundo: TIntegerField;
    dsCores: TDataSource;
    cbCor: TLMDColorComboBox;
    mtCoresCorFonte: TIntegerField;
    mtCoresNegrito: TBooleanField;
    GridItem: TdxDBGridMaskColumn;
    GridNegrito: TdxDBGridCheckColumn;
    GridCorFundo: TdxDBGridPopupColumn;
    GridCorFonte: TdxDBGridPopupColumn;
    procedure cbCorChange(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCorFundoInitPopup(Sender: TObject);
    procedure mtCoresCorFundoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GridCorFundoCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure GridChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure mtCoresCorFonteGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LeCores;
    procedure SalvaCores;
  public
    Items : TStrings;
    Cores : TStrings;
    IC    : TInfoCor;
    procedure EditaCor(aItems, aCores: TStrings);
    { Public declarations }
  end;

var
  FrmCor: TFrmCor;

implementation

uses uCMFrmPri;

{$R *.DFM}

procedure TFrmCor.LeCores;
var I : Integer;
begin
  mtCores.DisableControls;
  try
    mtCores.EmptyTable;
    for I := 0 to pred(Items.Count) do begin
      mtCores.Append;
      mtCoresItem.Value := Items[I];
      IC.Limpa;
      if Cores.Count <= I then
        Cores.Add(IC.GetStr);
      IC.LeStr(Cores[I]);  
      mtCoresCorFundo.Value := IC.icCorFundo;
      mtCoresCorFonte.Value := IC.icCorFonte;
      mtCoresNegrito.Value  := IC.icNegrito;
      mtCores.Post;
    end;
  finally
    mtCores.EnableControls;
  end;  
  mtCores.First;
end;

procedure TFrmCor.SalvaCores;
var I : Integer;
begin
  mtCores.DisableControls;
  try
    mtCores.First;
    I := 0;
    while not mtCores.Eof do begin
      IC.icCorFundo := mtCoresCorFundo.Value;
      IC.icCorFonte := mtCoresCorFonte.Value;
      IC.icNegrito  := mtCoresNegrito.Value;
      Cores[I] := IC.GetStr;
      Inc(I);
      mtCores.Next;
    end;  
  finally
    mtCores.EnableControls;
  end;    
end;

procedure TFrmCor.EditaCor(aItems, aCores: TStrings);
begin
  if aItems.Count=0 then
    Close
  else begin
    Items := aItems;
    Cores := aCores;
    LeCores;
    ShowModal;
  end;  
end;

procedure TFrmCor.cbCorChange(Sender: TObject);
begin
  if Grid.FocusedField.FieldName = 'CorFundo' then begin
    mtCoresCorFundo.Value := Integer(cbCor.SelectedColor);
    GridCorFundo.Color := cbCor.SelectedColor; 
  end else begin
    mtCoresCorFonte.Value := Integer(cbCor.SelectedColor);
    GridCorFonte.Color := cbCor.SelectedColor; 
  end;  
end;

procedure TFrmCor.cmGravarClick(Sender: TObject);
begin
  if mtCores.State = dsEdit then mtCores.Post;
  SalvaCores;
  Close;
end;

procedure TFrmCor.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCor.GridCorFundoInitPopup(Sender: TObject);
begin
  if mtCores.State <> dsEdit then mtCores.Edit;
  if Grid.FocusedField.FieldName = 'CorFundo' then 
    cbCor.SelectedColor := TColor(mtCoresCorFundo.Value)
  else  
    cbCor.SelectedColor := TColor(mtCoresCorFonte.Value);
end;

procedure TFrmCor.mtCoresCorFundoGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := '';
end;

procedure TFrmCor.GridCorFundoCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
var
  V : Variant;  
begin
  V := ANode.Values[AColumn.Index];
  if V <> null then
    AColor := V
  else
    AColor := clWhite; 
end;

procedure TFrmCor.GridChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var V : Variant;  
begin
  V := Node.Values[GridCorFundo.Index];
  if V <> null then
    gridCorFundo.Color := V
  else
    gridCorFundo.Color := clWhite; 

  V := Node.Values[GridCorFonte.Index];
  if V <> null then
    gridCorFonte.Color := V
  else
    gridCorFonte.Color := clWhite; 
end;

procedure TFrmCor.mtCoresCorFonteGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := '';
end;

procedure TFrmCor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

end.
