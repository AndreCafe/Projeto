unit uCMFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxExEdtr, dxEdLib, dxEditor, ExtCtrls, StdCtrls,
  uCMFrmPri,
  lmdctrl, lmdbtn,Registry, ComCtrls, lmdstdcA, Mask, dxDBELib, dxBar,
  DbTables, Db, nxdb, lmdcctrl, dxInspct, dxDBInsp,
  dxInspRw, dxDBInRw, dxInRwEx, dxLayout, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, kbmMemTable, lmdgroup, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, OvcBase, OvcEF,
  OvcPB, OvcPF, DBCtrls, LMDCustomComponent, LMDVersionInfo, dxPageControl,
  dxBarDBNav, OvcAe, LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox,
  dxBarExtItems, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel,
  LMDSimpleLabel, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton,
  LMDCustomLabel, LMDLabel, dxDBEdtr, OvcCmbx, OvcClrCb, OvcDbCCb,
  LMDCustomComboBox, LMDCustomColorComboBox, LMDDBColorComboBox;

type
  TFrmConfig = class(TForm)
    BarMgr: TdxBarManager;
    Layouts: TdxDBGridLayoutList;
    layoutCidades: TdxDBGridLayout;
    OvcController1: TOvcController;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    Paginas: TdxPageControl;
    dxTabSheet1: TdxTabSheet;
    dxTabSheet2: TdxTabSheet;
    Insp: TdxDBInspector;
    InspNomeProdImp: TdxInspectorLookupRow;
    InspFecharProgramas: TdxInspectorDBCheckRow;
    InspAutoExecutar: TdxInspectorDBMaskRow;
    InspPacoteTempoReal: TdxInspectorDBCheckRow;
    InspPermiteLoginSemCred: TdxInspectorDBCheckRow;
    InspPausarFimPacote: TdxInspectorDBCheckRow;
    InspRow9: TdxInspectorDBCheckRow;
    InspRow10: TdxInspectorDBTimeRow;
    InspLimiteTempoPadrao: TdxInspectorDBTimeRow;
    InspRow11: TdxInspectorDBCheckRow;
    InspRow12: TdxInspectorDBImageRow;
    InspRow13: TdxInspectorDBCheckRow;
    InspRow14: TdxInspectorDBTimeRow;
    InspRow15: TdxInspectorDBCheckRow;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edLivre: TLMDDBColorComboBox;
    edPre: TLMDDBColorComboBox;
    edPos: TLMDDBColorComboBox;
    edManutencao: TLMDDBColorComboBox;
    edAguardaPagto: TLMDDBColorComboBox;
    edPausada: TLMDDBColorComboBox;
    edFLivre: TLMDDBColorComboBox;
    edFPre: TLMDDBColorComboBox;
    edFPos: TLMDDBColorComboBox;
    edFManutencao: TLMDDBColorComboBox;
    edFAguardaPagto: TLMDDBColorComboBox;
    edFPausada: TLMDDBColorComboBox;
    Label7: TLabel;
    Label8: TLabel;
    lbLivre: TLMDSimpleLabel;
    lbPre: TLMDSimpleLabel;
    lbPos: TLMDSimpleLabel;
    lbManutencao: TLMDSimpleLabel;
    lbAguardaPagto: TLMDSimpleLabel;
    lbPausada: TLMDSimpleLabel;
    InspRow16: TdxInspectorDBImageRow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edLivreChange(Sender: TObject);
  private
    { Private declarations }
  public
    FTipos : Array[1..20] of String[15];
    procedure AjustaTeste;
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;
                       
implementation

uses cmClassesBase, uCMDados, uCMFrmCor, cmIDRecursos;

{$R *.DFM}

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  with Dados.tbConfig do
  if State in [dsEdit, dsInsert]  then
    Cancel;
end;

procedure TFrmConfig.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter :
    if ssCtrl in Shift then 
      cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmConfig.cmGravarClick(Sender: TObject);
var
  St : String;
begin
  with Dados do begin
    tbConfig.Post;
    CM.Config.LeDataset(tbConfig);
    CM.SalvaAlteracoesObj(CM.Config, False);
    AjustaCampoLocalizaCli;
  end;
  Close;  
end;

procedure TFrmConfig.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
  Dados.tbConfig.Edit;
  Paginas.ActivePageIndex := 0;
  cmGravar.Enabled := Permitido(reConfig, taCFGParametros);
end;

procedure TFrmConfig.AjustaTeste;
begin
  lbLivre.Color := edLivre.SelectedColor;
  lbLivre.Font.Color := edFLivre.SelectedColor;
  lbPre.Color := edPre.SelectedColor;
  lbPre.Font.Color := edFPre.SelectedColor;
  lbPos.Color := edPos.SelectedColor;
  lbPos.Font.Color := edFPos.SelectedColor;
  lbManutencao.Color := edManutencao.SelectedColor;
  lbManutencao.Font.Color := edFManutencao.SelectedColor;
  lbAguardaPagto.Color := edAguardaPagto.SelectedColor;
  lbAguardaPagto.Font.Color := edFAguardaPagto.SelectedColor;
  lbPausada.Color := edPausada.SelectedColor;
  lbPausada.Font.Color := edFPausada.SelectedColor;
end;

procedure TFrmConfig.edLivreChange(Sender: TObject);
begin
  AjustaTeste;
end;

end.
