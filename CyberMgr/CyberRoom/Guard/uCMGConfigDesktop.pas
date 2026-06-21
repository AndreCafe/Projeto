unit uCMGConfigDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StShlCtl, StdCtrls, ExtCtrls, SsBase, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, LMDSimplePanel, IniFiles,
  LMDCustomSimpleLabel, LMDSimpleLabel, lmdcont, LMDCustomComponent,
  ImgList, cxPC, cxControls, cxStyles, cxGraphics, cxEdit, cxCheckBox,
  cxImageComboBox, cxTextEdit, cxVGrid, cxInplaceContainer, cxColorComboBox;

type
  TFrmDesktop = class(TForm)
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    btnCancelar: TLMDSpeedButton;
    Icones16: TImageList;
    LMDBitmapList1: TLMDBitmapList;
    btnSalvar: TLMDSpeedButton;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsDesktop: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    panDesktop: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    lvExibir: TStShellListView;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    LMDLabel3: TLMDLabel;
    btnRemoverTodos: TLMDSpeedButton;
    LMDSplitterPane2: TLMDSplitterPane;
    lvRem: TStShellListView;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    btnExibirTodos: TLMDSpeedButton;
    LMDLabel4: TLMDLabel;
    vgOP: TcxVerticalGrid;
    vgOPFecharProg: TcxEditorRow;
    vgOPReiniciar: TcxEditorRow;
    vgOPAlinhar: TcxEditorRow;
    vgOPRestr: TcxCategoryRow;
    vgOPMenuIniciar: TcxEditorRow;
    vgOPPainelControle: TcxEditorRow;
    vgOPCtrlAltDel: TcxEditorRow;
    vgOPCmdExec: TcxEditorRow;
    vgOPRestrDesktop: TcxEditorRow;
    vgOPIE: TcxCategoryRow;
    vgOPDownload: TcxEditorRow;
    vgOPPaginaInicial: TcxEditorRow;
    vgOPCorFDesktop: TcxEditorRow;
    vgOPCorDesktop: TcxEditorRow;
    procedure lvExibirFilterItem(Sender: TObject; ShellItem: TStShellItem;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lvExibirDblClick(Sender: TObject);
    procedure lvRemFilterItem(Sender: TObject;
      ShellItem: TStShellItem; var Accept: Boolean);
    procedure lvRemDblClick(Sender: TObject);
    procedure btnExibirTodosClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRemoverTodosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure vgOPRestrDesktopEditPropertiesChange(Sender: TObject);
  private
    slR, slD: TStrings;   
    { Private declarations }
  public
    function ConfiguraDesktop: Boolean;
    { Public declarations }
  end;

var
  FrmDesktop: TFrmDesktop;

implementation

uses uCMGPri;

{$R *.dfm}

procedure TFrmDesktop.lvExibirFilterItem(Sender: TObject; ShellItem: TStShellItem;
  var Accept: Boolean);
begin
  Accept := StrBool(slD.Values[ShellItem.Path]);
end;

procedure TFrmDesktop.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesktop.lvExibirDblClick(Sender: TObject);
begin
  if lvExibir.SelectedItem=nil then Exit;
  slD.Values[lvExibir.SelectedItem.Path] := BoolStr(False);
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.lvRemFilterItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
begin
  Accept := not StrBool(slD.Values[ShellItem.Path]);
end;

procedure TFrmDesktop.lvRemDblClick(Sender: TObject);
begin
  if lvRem.SelectedItem=nil then Exit;
  slD.Values[lvRem.SelectedItem.Path] := BoolStr(True);
  lvExibir.Refresh;
  lvRem.Refresh;
end;

procedure TFrmDesktop.btnExibirTodosClick(Sender: TObject);
var 
  I : Integer;
begin
  with lvRem do
  for I := 0 to ShellItems.Count-1 do
  with ShellItems.Items[I] do 
    slD.Values[Path] := BoolStr(True);
  lvExibir.Refresh;
  lvRem.Refresh;  
end;

procedure TFrmDesktop.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;;
end;

procedure TFrmDesktop.btnRemoverTodosClick(Sender: TObject);
begin
  slD.Clear;
  lvRem.Refresh;
  lvExibir.Refresh;
end;

procedure TFrmDesktop.FormDestroy(Sender: TObject);
begin
  slD.Free;
  slR.Free;
end;

function TFrmDesktop.ConfiguraDesktop: Boolean;
begin
  slD.Text := FrmPri.slD.Text;
  slR.Text := FrmPri.slR.Text;
  lvExibir.Filtered := True;
  lvRem.Filtered := True;
  
  with slR do begin
    vgOPFecharProg.Properties.Value  := StrBool(Values[opFecharProg]);
    vgOPReiniciar.Properties.Value   := StrBool(Values[opReiniciar]);
    vgOPAlinhar.Properties.Value     := StrToIntDef(Values[opAlinhamento], 0);
    vgOPMenuIniciar.Properties.Value := StrBool(Values[opMenuIniciar]);
    vgOPPainelControle.Properties.Value := StrBool(Values[opPainelControle]);
    vgOPCtrlAltDel.Properties.Value := StrBool(Values[opCtrlAltDel]);
    vgOPCmdExec.Properties.Value    := StrBool(Values[opCmdExec]);
    vgOPRestrDesktop.Properties.Value := StrBool(Values[opRestrDesktop]);
    vgOPDownload.Properties.Value    := StrBool(Values[opBloqDownload]);
    vgOPPaginaInicial.Properties.Value := Values[opPaginaInicial];
    vgOPCorFDesktop.Properties.Value := StrToIntDef(Values[opCorFundoDesktop], clBackground);
    vgOPCorDesktop.Properties.Value  := StrToIntDef(Values[opCorFonteDesktop], clBlack);
  end;
  tsDesktop.TabVisible := vgOPRestrDesktop.Properties.Value;
  
  Result := (ShowModal = mrOk);
end;

procedure TFrmDesktop.btnSalvarClick(Sender: TObject);
begin
  with slR do begin
    Values[opFecharProg] := BoolStr(vgOPFecharProg.Properties.Value );
    Values[opReiniciar] := BoolStr(vgOPReiniciar.Properties.Value  );
    Values[opAlinhamento] := vgOPAlinhar.Properties.Value     ;
    Values[opMenuIniciar] := BoolStr(vgOPMenuIniciar.Properties.Value);
    Values[opPainelControle] := BoolStr(vgOPPainelControle.Properties.Value);
    Values[opCtrlAltDel] := BoolStr(vgOPCtrlAltDel.Properties.Value);
    Values[opCmdExec] := BoolStr(vgOPCmdExec.Properties.Value);
    Values[opRestrDesktop] := BoolStr(vgOPRestrDesktop.Properties.Value);
    Values[opBloqDownload] := BoolStr(vgOPDownload.Properties.Value);
    Values[opPaginaInicial] := vgOPPaginaInicial.Properties.Value;
    Values[opCorFundoDesktop] := vgOPCorFDesktop.Properties.Value;
    Values[opCorFonteDesktop] := vgOPCorDesktop.Properties.Value;
  end;  
  slD.SaveToFile(DesktopFName);
  slR.SaveToFile(RestrFName);
  FrmPri.slD.Text := slD.Text;
  FrmPri.slR.Text := slR.Text;
  ModalResult := mrOk;
  Close;
end;

procedure TFrmDesktop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDesktop.FormCreate(Sender: TObject);
begin
  slD := TStringList.Create;
  slR := TStringList.Create;
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmDesktop.vgOPRestrDesktopEditPropertiesChange(
  Sender: TObject);
begin
  tsDesktop.TabVisible := vgOPRestrDesktop.Properties.Value;
end;

end.
